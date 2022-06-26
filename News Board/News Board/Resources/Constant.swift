//
//  Constant.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-25.
//

import Foundation

struct Constant {
    
    //MARK: -  Server URL
    public static var API_BASE_URL =  "https://api.themoviedb.org/3/"
    public static var RESOURCE_BASE_URL = "https://image.tmdb.org/t/p/original"
    
    //MARK: - Keys
    public static var MOVIE_API_KEY = "0e7274f05c36db12cbe71d9ab0393d47"
    
    //MARK: - Table Cell Identifier
    public static var MOVIE_TABLE_CELL = "MovieTVC"
    
    //MARK: - Navigation Titiles
    public static var NOW_PLAYING_TITLE = "Now Playing"
    
    
    //MARK: - Segue Identifier
    public static var SIGNUP_SEGUE = "signup"
    public static var DASHBOARD_SEGUE = "dashboard"
    
    //MARK: - Alerts Headers
    static let ALERT_HEADER = "News Board"
    
    //MARK: - Success Alerts
    static let USER_CREATE_SUCCESS = "User Registration successfully"
    
    //MARK: - Error Alerts
    static let USER_LOGGIN_FAIL = "Invalid username or password"

}
