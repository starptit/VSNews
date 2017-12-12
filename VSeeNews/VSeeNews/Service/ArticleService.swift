//
//  ArticleService.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire

protocol ArticleAbstractService {
    func fetchListArticle(withCompletion completion: @escaping ([ArticleEntity],Error?) -> ())
}


struct ArticleService:ArticleAbstractService {
    func fetchListArticle(withCompletion completion: @escaping ([ArticleEntity],Error?) -> ()){
        let urlRequest = String("https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=\(ConstantDefine.NEWS_API_KEY)")
        let endpointUrl = URL(string: urlRequest)
        let requestObject:RequestAbstractProtocol = RequestObject(endpointUrl: endpointUrl, parameters: nil, headers: nil, method: .get)
        
        CoreAPIService.shared.fetchRequestJSON(request: requestObject, serviceModule: ServiceModule.alamofire) { (responseObject:GetArticleResponse?, error) in
            guard let articleResponse = responseObject else{
                completion([],error)
                return
            }
            completion(articleResponse.articleList,error)
        }
    }
}
