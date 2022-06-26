//
//  LoginViewModel.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation

class SignupViewModel {
    
    func inputValidation(username: String?, password: String?, confirm_password: String?) -> (Bool,String) {
        
        if username == nil || username!.isEmpty {
            return (false, "Please enter username")
        }
        
        if password == nil || password!.isEmpty {
            return (false, "Please enter password")
        }
        
        if confirm_password == nil || confirm_password!.isEmpty {
            return (false, "Please enter confirm password")
        }
        
        if confirm_password!.count < 5 {
            return (false, "Password should have at least 5 characters")
        }
        
        if password != confirm_password {
            return (false, "Password and confirm password doesn't match")
        }
        
        return (true , "")
    }
}
