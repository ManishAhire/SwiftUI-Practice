//
//  NetworkUtility.swift
//  HackerNews
//
//  Created by Manish Ahire on 15/01/26.
//

import Foundation

enum HTTPError: Error {
    case invalidURL
    case badServerResponse
}

class HTTPUtility {
    
    static let shared: HTTPUtility = HTTPUtility()
    
    private init() {
        
    }
    
    func fetchAllNews() async throws -> [Post] {
        
        let strURL = "http://hn.algolia.com/api/v1/search?tags=front_page"
        
        guard let url = URL(string: strURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw HTTPError.badServerResponse
        }
        
        let result = try JSONDecoder().decode(News.self, from: data)
        return result.hits
    }
}
