//
//  DateExtension.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/10/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

extension Date {
    func convertToString(withFormat format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

