//
//  NewsAPI.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation
import Alamofire


struct NewsAPI {
    
    static func getTopHeadlinesList(category: String, country:String,page: Int, completed: @escaping(Result<TopHeadlineResponse, APIErrors>)-> Void) {
        
        var url =  "\(Constant.API_BASE_URL)top-headlines?page=\(page)&pageSize=10"
        
        if !country.isEmpty {
            url += "&country=\(country)"
        }
        
        if !category.isEmpty {
            url += "&category=\(category.lowercased())"
        }
        
        print(url)
        
        let request = BaseService.shared.generateRequest(url: url, method: .get, body: nil)
        
        AF.request(request).validate().responseDecodable(of: TopHeadlineResponse.self, decoder: BaseService.shared.decoder) { (response) in
            
            switch response.result {
                
            case .success(let result):
                
                completed(.success(result))
                
            case .failure(let error):
                
                print("Error from getTopHeadlinesList: - \(error)")
                
                if error.isResponseSerializationError {
                    
                    completed(.failure(.invalidResponse))
                    
                } else {
                    completed(.failure(.unableToComplete))
                }
            }
        }
    }
}
