//
//  LoginViewModel.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation

class LoginViewModel {
    
    func userValidation (username: String?, password: String?) -> (Bool, String) {
        
        if username == nil || username!.isEmpty {
            return (false, "Please enter username")
        }
        
        if password == nil || password!.isEmpty {
            return (false, "Please enter password")
        }
        
        if let re_username = AppSessionManager.getUsername(), let re_password = AppSessionManager.getAuthPassword()  {
            
            if username == re_username && password == re_password {
                return (true, "")
            } else {
                return (false, Constant.USER_LOGGIN_FAIL)
            }
            
        } else {
            
            return (false, Constant.USER_LOGGIN_FAIL)
            
        }
        
    }
}
