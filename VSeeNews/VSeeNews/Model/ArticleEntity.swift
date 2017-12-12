//
//  ArticleEntity.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class GetArticleResponse:Mappable{
    var status:String?
    var articleList:[ArticleEntity] = []
    
    // MARK: - Object Maper support
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        articleList <- map["articles"]
    }
}

class ArticleEntity: Object,Mappable {

    @objc dynamic var author:String?
    @objc dynamic var title:String?
    @objc dynamic var desc:String?
    @objc dynamic var url:String?
    @objc dynamic var urlImage:String?
    @objc dynamic var publishDate:Date?
    @objc dynamic var sourceArticle:ArticleSourceEntity?
    
    //realm primary key
    override class func primaryKey() -> String? {
        return "url"
    }
    
    // MARK: - Object Maper support
    required convenience init?(map: Map) {
        self.init()
    }
    
    /**
     * Mapping data from api depend on key.
     */
    
    func mapping(map: Map) {
        sourceArticle <- map["source"]
        author <- map["author"]
        title <- map["title"]
        desc <- map["description"]
        url <- map["url"]
        urlImage <- map["urlToImage"]
        var publishDateAsString = ""
        publishDateAsString <- map ["publishedAt"]
        
        publishDate = publishDateAsString.convertToDate(withFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    }
}
