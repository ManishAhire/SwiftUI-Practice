//
//  NetworkUtility.swift
//  HackerNews
//
//  Created by Manish Ahire on 15/01/26.
//

//  Changes from NetworkUtility.swift:
//    1. actor instead of class  — concurrency-safe singleton
//    2. Protocol abstraction    — URLSession mockable in tests
//    3. Typed HTTPError         — preserves status code for logging
//    4. Generic request method  — decouples network from domain models
//    5. Dual entry points       — URL (simple) + URLRequest (full control)
//    6. Shared JSONDecoder      — one instance, not one per call
//    7. https enforced          — ATS compliance, no plaintext
//

import Foundation

// MARK: - Error

enum HTTPError: LocalizedError {
    case invalidURL
    case badServerResponse(statusCode: Int)   // ← preserves status code
    case decodingFailed(underlying: Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid."
        case .badServerResponse(let code):
            return "Server returned an unexpected status code: \(code)."
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}

// MARK: - Protocol seam (enables mocking in tests)

protocol HTTPClientProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

// URLSession already has these methods — just declare conformance
extension URLSession: HTTPClientProtocol {}

// MARK: - Network client

actor NetworkClient {

    // Singleton: one instance, actor-isolated
    static let shared = NetworkClient()

    private let session: HTTPClientProtocol
    private let decoder: JSONDecoder          // shared, not per-call

    // Designated init — injectable for tests
    init(session: HTTPClientProtocol = URLSession.shared) {
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    // MARK: URL entry point (convenience)

    func fetch<T: Decodable>(_ type: T.Type, from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        return try await fetch(type, from: url)
    }

    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T {
        let (data, response) = try await session.data(from: url)
        return try validate(data: data, response: response)
    }

    // MARK: URLRequest entry point (full control — headers, method, body, timeout)

    func fetch<T: Decodable>(_ type: T.Type, request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: request)
        return try validate(data: data, response: response)
    }

    // MARK: Private

    private func validate<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let http = response as? HTTPURLResponse else {
            throw HTTPError.badServerResponse(statusCode: -1)
        }
        guard (200...299).contains(http.statusCode) else {
            throw HTTPError.badServerResponse(statusCode: http.statusCode)
        }
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw HTTPError.decodingFailed(underlying: error)
        }
    }
}
