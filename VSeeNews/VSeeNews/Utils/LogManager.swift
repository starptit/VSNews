//
//  LogManager.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

struct Log {
    static func debug(message: String, function: String = #function) {
        #if !NDEBUG
            let date = Date().convertToString(withFormat: "HH:mm:ss")
            print("\(date) Func: \(function) : \(message)")
        #endif
    }
}

