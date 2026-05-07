//
//  Post.swift
//  HackerNews
//
//  Created by Manish Ahire on 15/01/26.
//

import Foundation

struct News: Decodable {
    let posts: [Post]
}

struct Post: Identifiable, Decodable  {
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}

