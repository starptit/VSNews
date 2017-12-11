//
//  Realm+Security.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/10/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift

extension Realm {
    /**
     *
     */
    func encryptRealmDatabase(key: Data, destinationPath: String) throws {
        let fileUrl = URL(fileURLWithPath: destinationPath)
        try self.writeCopy(toFile: fileUrl, encryptionKey: key)
    }
}
