//
//  File.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import Foundation

class UserListVM: ObservableObject {
    
    @Published var userList: [UserResponse] = []
    
    func getUserList() {
        
        if let users = ReadData.shared.readJsonData(from: "ResponseData", responseType: [UserResponse].self)  {
           userList = users
        }
    }
}
