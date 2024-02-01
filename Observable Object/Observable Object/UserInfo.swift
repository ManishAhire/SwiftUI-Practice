//
//  UserInfo.swift
//  Observable Object
//
//  Created by Manish Ahire on 01/02/24.
//

import Foundation

class UserInfo : ObservableObject {
    
    @Published var name: String = String()
    @Published var age: Int = 0
    
    func changeUserInfo(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
