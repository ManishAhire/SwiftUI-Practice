//
//  UserListRow.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct UserListRow: View {
    
    var user: UserResponse
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(user.title)
                .font(.headline)
            
            Text(user.description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

#Preview {
    UserListRow(user: UserResponse(userID: 1, id: 1, title: "Test", description: "Test Description"))
}
