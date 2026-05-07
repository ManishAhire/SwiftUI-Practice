//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Manish Ahire on 07/05/26.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    
    @Published private(set) var posts: [Post] = []
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    private let service : NewsService
    
    init(service: NewsService = .shared) {
        self.service = service
    }
    
    func load() async {
        
        guard !isLoading else {
            return
        }
        
        isLoading = true
        error = nil
        defer {
            isLoading = false
        }
        
        do {
            posts = try await service.fetchFrontPage()
        } catch {
            self.error = error
        }
        
    }
}
