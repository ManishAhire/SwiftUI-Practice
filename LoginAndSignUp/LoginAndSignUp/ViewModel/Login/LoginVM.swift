//
//  LoginVM.swift
//  LoginAndSignUp
//
//  Created by Manish Ahire on 31/01/24.
//

import Foundation

class LoginVM : ObservableObject {
    
    @Published var userEmail: String = String()
    @Published var userPassword: String = String()
    @Published var errorMessage: String = String()
    @Published var navigate: Bool = false
    @Published var isPresentingAlert: Bool = false
    
    private let loginValidation = LoginValidation()
    
    
    func validateUserInputs() -> Bool {
        
        let result = loginValidation.validateUserInputs(userEmail: userEmail, password: userPassword)
        
        if result.errorMessage != nil {
            errorMessage = result.errorMessage ?? "Error"
            isPresentingAlert = true
            return false
        }
        
        
        return true
            
    }
    
    func authenticateUser() {
        navigate = true
    }
}
