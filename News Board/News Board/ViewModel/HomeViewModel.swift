//
//  HomeViewModel.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation


class HomeViewModel {
    
    public var totalPages = 0
    public var page  = 1
    public var isLoad = false
    
    func loadTopHeadLines(category: String, country:String, isRest: Bool, completion: @escaping (Result<[Article], APIErrors>)->Void) {
        
        if isLoad {return}
        
        isLoad = true
        
        if !isRest {
            page += 1
        }
        
        if totalPages != 0 && totalPages < page  {
            
            completion(.failure(.pageLimitExceed))
            print("page limit exceed")
            return
        }
        
        NewsAPI.getTopHeadlinesList(category: category, country: country, page: page) { [self] result in
            
            switch result {
                
            case .success(let res):
                
                isLoad = false
                
                totalPages = res.totalResults 
                
                if let list = res.articles {
                    completion(.success(list))
                }else {
                    completion(.failure(.unableToComplete))
                }
                
                
            case .failure(let err):
                
                isLoad = false
                completion(.failure(err))
            }
            
        }
    }
}
