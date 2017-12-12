//
//  StringExtension.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

extension String{
    func convertToDate(withFormat format:String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
