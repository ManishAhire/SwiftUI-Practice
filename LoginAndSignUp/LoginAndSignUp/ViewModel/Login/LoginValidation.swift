//
//  LoginValidation.swift
//  LoginAndSignUp
//
//  Created by Manish Ahire on 31/01/24.
//

import Foundation

struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

struct LoginValidation {
    
    func validateUserInputs(userEmail: String, password: String) -> ValidationResult {
        
        if userEmail.isEmpty {
            return ValidationResult(success: false, errorMessage: "User email can't be empty")
        }
        
        if isValidEmail(userEmail) == false {
            return ValidationResult(success: false, errorMessage: "User email format is incorrect")
        }
        
        if password.isEmpty {
            return ValidationResult(success: false, errorMessage: "Password can't be empty")
        }
        
        return ValidationResult(success: true, errorMessage: nil)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
