//
//  UserResponse.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import Foundation

struct UserResponse: Decodable {
    
    let userID: Int
    let id: Int
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case description = "body"
        
        case id
        case title
    }
}
