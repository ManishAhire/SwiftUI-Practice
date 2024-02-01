//
//  UserDetails.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct UserDetails: View {
    
    var user : UserResponse
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("User Id: \(user.userID)")
                .font(.headline)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Titile :")
                    .font(.headline)
                Text(user.title)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Description: ")
                    .font(.headline)
                Text(user.description)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("User Details")
    }
}

#Preview {
    UserDetails(user: UserResponse(userID: 1, id: 1, title: "Test", description: "Test Description"))
}
