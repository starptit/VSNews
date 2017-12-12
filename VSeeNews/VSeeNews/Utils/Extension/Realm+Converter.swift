//
//  Realm+Converter.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/10/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift


/****************
 
 - EXTENSION INHERITED REALM RESULTS ARRAY
 
 ****************/
extension Results{
    
    func toArray<T>(ofType: T.Type) -> [T] {
        return flatMap{ $0 as? T}
    }
}

extension RealmSwift.List{
    func toArray<T>(ofType: T.Type) -> [T]{
        return flatMap{ $0 as? T}
    }
}

