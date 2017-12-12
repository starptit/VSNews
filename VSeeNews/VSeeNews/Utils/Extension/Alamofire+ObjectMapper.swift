//
//  Alamofire+ObjectMapper.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

extension DataResponse{
    func toMapperObject<T:Mappable>() -> T?{
        return Mapper<T>().map(JSONObject: self.result.value)
    }
}
