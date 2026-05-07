//
//  NewsService.swift
//  HackerNews
//
//  Created by Manish Ahire on 07/05/26.
//

import Foundation

// MARK: - Usage example (domain layer — NOT inside NetworkClient)


protocol NewsServiceProtocol {
    func fetchFrontPage() async throws -> [Post]
}

// Service owns the URL and the model — network client stays generic
actor NewsService: NewsServiceProtocol {
    
    static let shared = NewsService()
    private let client: NetworkClient

    init(client: NetworkClient = .shared) {
        self.client = client
    }

    func fetchFrontPage() async throws -> [Post] {
        let news = try await client.fetch(
            News.self,
            from: "https://hn.algolia.com/api/v1/search?tags=front_page"
        )
        return news.hits
    }
}
