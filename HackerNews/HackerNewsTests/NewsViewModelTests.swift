//
//  NewsViewModelTests.swift
//  HackerNewsTests
//
//  Created by Manish Ahire on 07/05/26.
//

import XCTest
@testable import HackerNews

final class MockNewService: NewsServiceProtocol {
    var stubbedPosts: [Post] = []
    var shouldThrow = false
    
    func fetchFrontPage() async throws -> [Post] {
        if shouldThrow {
            throw HTTPError.badServerResponse(statusCode: 500)
        }
        
        return stubbedPosts
    }
}

@MainActor
final class NewsViewModelTests: XCTestCase {

    
    func testLoadPopulatesPosts() async {
        let mock = MockNewService()
        mock.stubbedPosts = [Post(objectID: "1", title: "Test", url: nil, points: 10)]
        let vm = NewsViewModel(service: mock)
        
        await vm.load()
        
        XCTAssertEqual(vm.posts.count, 1)
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.error)
    }
    
    func testLoadSetsErrorOnFailure() async {
        let mock = MockNewService()
        mock.shouldThrow = true
        
        let vm = NewsViewModel(service: mock)
        
        await vm.load()
        
        XCTAssertNotNil(vm.error)
        XCTAssertTrue(vm.posts.isEmpty)
        
    }
}
