//
//  ContentView.swift
//  Observable Object
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var info : UserInfo = UserInfo()
    
    var body: some View {
        VStack {
            
            Text("User Name: \(info.name)")
            Text("User Age: \(info.age)")
            
        }
        .onAppear() {
            info.changeUserInfo(name: "Manish", age: 30)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
