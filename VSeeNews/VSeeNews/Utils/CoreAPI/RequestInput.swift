//
//  RequestAbstractProtocol.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

public enum HTTPRequestMethod{
    case get
    case put
    case post
    case delete
    case option
}

protocol RequestAbstractProtocol{
    var endpointUrl:URL? {get set}
    var parameters:[String:Any]? {get set}
    var headers:[String:String]? {get set}
    var method:HTTPRequestMethod {get set}
}

protocol RequestJSONProtocol:RequestAbstractProtocol{
    
}

struct RequestObject:RequestAbstractProtocol{
    var endpointUrl:URL?
    var parameters:[String:Any]?
    var headers:[String:String]?
    var method:HTTPRequestMethod
    
    init(endpointUrl:URL?, parameters:[String:Any]?, headers:[String:String]?, method:HTTPRequestMethod){
        self.endpointUrl = endpointUrl
        self.parameters = parameters
        self.headers = headers
        self.method = method
    }
}
