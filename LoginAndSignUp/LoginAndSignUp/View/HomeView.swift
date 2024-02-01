//
//  HomeView.swift
//  LoginAndSignUp
//
//  Created by Manish Ahire on 30/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var loginVM: LoginVM
    
    var body: some View {
        
        VStack {
            Text("User Name: \(loginVM.userEmail)")
                .font(.headline)
            
                .toolbar {
                    NavigationLink("Log Out", destination: LoginView())
                }
            
        }
        .padding()
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    HomeView()
}
