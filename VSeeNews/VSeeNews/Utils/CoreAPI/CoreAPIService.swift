//
//  CoreAPIService.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

public enum ServiceModule{
    case alamofire
    case urlConnetion
}

struct CoreAPIService{
    
    static let shared = CoreAPIService()
    func fetchRequestJSON<T:Mappable>(request:RequestAbstractProtocol, serviceModule:ServiceModule, withCompletion completion:@escaping ((T?,Error?) -> ())){
        switch serviceModule {
        case .alamofire:
            getRequestAlamofireJSON(request: request, withCompletion: { (responseObject, error) in
                completion(responseObject,error)
            })
            return
        default:
            return
        }
    }
    
    func getRequestAlamofireJSON<T:Mappable>(request:RequestAbstractProtocol, withCompletion completion:@escaping ((T?,Error?) -> ())){
        let alamofireMethod = getAlamofireMethodFromCustomMethod(method: request.method)
        Alamofire.request(request.endpointUrl?.absoluteString ?? "", method: alamofireMethod, parameters: request.parameters, encoding: JSONEncoding.default, headers: request.headers).responseJSON { (response) in
            Log.debug(message: response.debugDescription)
            completion(response.toMapperObject(),response.error)
        }
    }
    
    func getAlamofireMethodFromCustomMethod(method:HTTPRequestMethod) -> HTTPMethod{
        switch method{
        case .get:
            return HTTPMethod.get
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        case .option:
            return HTTPMethod.options
        case .post:
            return HTTPMethod.post
        }
    }
}
