//
//  ContentView.swift
//  Binding Property Wrapper For Sheet
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingAddUser: Bool = false
    
    var body: some View {
        VStack {
            
            Button("Add User") {
                showingAddUser.toggle()
            }
        }
        .sheet(isPresented: $showingAddUser)  {
            AddUser(isPresented: $showingAddUser)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
