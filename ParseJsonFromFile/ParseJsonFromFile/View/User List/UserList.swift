//
//  UserList.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct UserList: View {
    
    @ObservedObject var userListVM: UserListVM = UserListVM()
    
    var body: some View {
        
        NavigationView {
            
            List(userListVM.userList, id: \.id) { user in
                
                NavigationLink(destination: UserDetails(user: user)) {
                    UserListRow(user: user)
                }
                
            }
            .listStyle(.grouped)
            .onAppear() {
                userListVM.getUserList()
            }
            .navigationTitle("User List")
        }
        
    }
}

#Preview {
    UserList()
}
