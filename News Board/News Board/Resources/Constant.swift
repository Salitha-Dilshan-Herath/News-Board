//
//  Constant.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-25.
//

import Foundation

struct Constant {
    
    //MARK: -  Server URL
    public static var API_BASE_URL =  "https://newsapi.org/v2/"

    //MARK: - Keys
    public static var NEWS_API_KEY = "496d1750621543f29cbc3367f63fbbf3"
    
    //MARK: - News Categories
    public static var NEWS_CATEGORIES = ["Sports","General", "Business", "Entertainment", "Science", "Technology"]
    
    //MARK: - Table Cell Identifier
    public static var TOP_NEWS_TABLE_CELL = "top_news"
    public static var LATEST_NEWS_COLLECTION_VIEW_CELL = "hot_news"
    public static var NEWS_CATEGORY_COLLECTION_VIEW_CELL = "category"
    
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
