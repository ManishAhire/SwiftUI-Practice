//
//  LoginView.swift
//  LoginAndSignUp
//
//  Created by Manish Ahire on 30/01/24.
//

import SwiftUI


struct LoginView: View {
    
    @ObservedObject var loginVM = LoginVM()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    TextField("User email", text: $loginVM.userEmail)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $loginVM.userPassword)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                HStack {
                    
                    NavigationLink(destination: HomeView(), isActive: $loginVM.navigate) {
                        Button("Login") {
                            
                            if loginVM.validateUserInputs() {
                                loginVM.authenticateUser()
                            }
                        }
                        .alert(isPresented: $loginVM.isPresentingAlert, content: {
                            Alert(title: Text("Alert"), message: Text(loginVM.errorMessage), dismissButton: .cancel())
                        })
                    }

                    Spacer()
                    
                    NavigationLink("Forgot Password") {
                        ForgotPassword()
                    }
                }
                .padding()
                
                NavigationLink("Register User") {
                    RegisterUserView()
                }
                
            }
            .padding()
            
            .navigationTitle("Login")
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(loginVM)
        
    }
}

#Preview {
    LoginView()
}
