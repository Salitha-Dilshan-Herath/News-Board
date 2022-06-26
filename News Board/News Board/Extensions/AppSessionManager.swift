//
//  AppSessionManager.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation


class AppSessionManager: NSObject {
    
    public static let SESSION_MANAGER_STORE_USERNAME       = "com.newsboard.SESSION_MANAGER_STORE_USERNAME";
    
    public static let SESSION_MANAGER_STORE_AUTH_PASSWORD  = "com.onepay.SESSION_MANAGER_STORE_AUTH_PASSWORD";
    
    public override init() {}

    
    //save user's username
    static func saveUsername(name: String) {
        UserDefaults.standard.set(name, forKey: AppSessionManager.SESSION_MANAGER_STORE_USERNAME)
    }
    
    //get user's username
    static func getUsername() -> String? {
        return UserDefaults.standard.string(forKey: AppSessionManager.SESSION_MANAGER_STORE_USERNAME)
    }
    
    //save user's authentication password
    static func saveAuthPassword(password: String) {
        UserDefaults.standard.set(password, forKey: AppSessionManager.SESSION_MANAGER_STORE_AUTH_PASSWORD)
    }
    
    //get user's authentication password
    static func getAuthPassword() -> String? {
        return UserDefaults.standard.string(forKey: AppSessionManager.SESSION_MANAGER_STORE_AUTH_PASSWORD)
    }
    
    //remove object for given key from user defaults
    static func userDefaultsync() {
        UserDefaults.standard.synchronize()
    }
    
    //remove object for given key from user defaults
    static func removeObject(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    //remove all saved objects from user defaults
    static func removeAllObject() {
        if let identifier = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: identifier)
            UserDefaults.standard.synchronize()
        }
    }
    
}

