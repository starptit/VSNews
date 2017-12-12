//
//  ArticleSourceEntity.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ArticleSourceEntity: Object,Mappable {
    @objc dynamic var sourceId:String?
    @objc dynamic var name:String?
    
    // MARK: - Object Maper support
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        sourceId <- map["id"]
        name <- map["name"]
    }
}
