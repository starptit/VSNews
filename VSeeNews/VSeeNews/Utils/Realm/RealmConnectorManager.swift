//
//  RealmConnectorManager.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift

/********
 
 - CONFORM TO C-R-U-D PROPERTY OF DATABASE MANAGEMENT.
 - USING PROTOCOL - ORIENTED PROGRAMMING ARCHITECTURE
 
 *******/


class RealmConnectorManager: CreateRecordRealm,ReadRecordRealm,UpdateRecordRealm,DeleteRecordRealm {
    
    var realm:Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    class func connectDefault() -> Realm?{
        
        do{
            let realm = try Realm()
            realm.autorefresh = true
            
            return realm
            
        }catch _ {
            print("Cannot connect to DEFAULT Database")
        }
        
        return nil
    }
    
    class func connectDBWithConfiguration(configuration: Realm.Configuration) -> Realm?{
        do{
            
            let realm = try Realm(configuration: configuration)
            
            return realm
            
        }catch _ {
            print("Cannot connect to CONFIGURATION Database")
        }
        
        return nil
    }
    
    static let sharedDefaultManager:RealmConnectorManager = {
        let realm:Realm = RealmConnectorManager.connectDefault()!
        return RealmConnectorManager(realm: realm)
    }()
}

protocol RealmAbstraction{
    
    var realm:Realm {get set}
}

/****************
 
 - [C]REATE FUNCTIONAL.
 
 ****************/

protocol CreateRecordRealm:RealmAbstraction{
    
}

extension CreateRecordRealm{
    
    func createRecord(object: Object){
        
        do{
            
            try realm.write({
                realm.add(object, update: true)
            })
            
        }catch _ {
            
            print("Error When CreateRecordRealm")
        }
    }
    
    func createListRecord(listRecord: [Object]?){
        
        if listRecord == nil || listRecord?.count == 0 {
            
            print("List Object to be inserted is EMPTY")
            return
        }
        
        do{
            
            try realm.write({
                //                realm.add(listRecord!)
                realm.add(listRecord!, update: true)
            })
        }catch _ {
            print("Error when adding List Record")
        }
        
    }
}



/****************
 
 - [R]EAD FUNCTIONAL.
 
 ****************/

protocol ReadRecordRealm:RealmAbstraction {
    
}
extension ReadRecordRealm {
    
    func getRecordByPrimaryKey(objectType: Object.Type, idValue:AnyObject?) -> Object?{
        
        if let getRecord = realm.object(ofType: objectType, forPrimaryKey: idValue) {
            
            return getRecord
        }
        
        return nil
    }
    
    func getAllRecord(objecType: Object.Type) -> [Object]? {
        
        return realm.objects(objecType).toArray(ofType: objecType)
        
    }
    
    func isExistingRecord(objectType:Object.Type, primaryKey:AnyObject?) -> Bool {
        let returnObject = self.getRecordByPrimaryKey(objectType: objectType, idValue: primaryKey)
        
        if returnObject != nil {
            return true
        }
        
        return false
    }
    
    func filterRecordByQuery(objectType: Object.Type, query:NSPredicate) -> [Object]?{
        
        let returnObject = realm.objects(objectType).filter(query).toArray(ofType: objectType)
        
        return returnObject
    }
    
}



/****************
 
 - [U]PDATE FUNCTIONAL.
 
 ****************/
protocol UpdateRecordRealm:RealmAbstraction {
    
}
extension UpdateRecordRealm{
    func updateSpecifiedObjectWithProperties(object:Object,subSet:[String:AnyObject]?){
        
        do{
            
            try realm.write({
                
                guard subSet != nil else{
                    print("Nil UPDATE dictionary")
                    return
                }
                
                for (key,value) in subSet! {
                    object[key] = value
                }
                
                realm.add(object, update: true)
                
            })
            
        }catch _ {
            
            print("Error When updateRecordByPrimaryKey")
        }
    }
    
}



/****************
 
 - [D]ELETE FUNCTIONAL.
 
 ****************/
protocol DeleteRecordRealm:RealmAbstraction {
    
}
extension DeleteRecordRealm{
    
    func deleteListRecord(list:[Object]){
        
        do{
            
            try realm.write({
                realm.delete(list)
            })
            
        }catch _ {
            
            print("Error When deleteListRecord")
        }
    }
    
    func deleteRecord(object:Object){
        
        if object.isInvalidated == true {
            return
        }
        
        do{
            
            try realm.write({
                realm.delete(object)
            })
            
        }catch _ {
            
            print("Error When deleteRecord")
        }
        
    }
    
    func deleteAllRecordOfCurrentObject(objectType:Object.Type){
        
        do{
            let allRecord = realm.objects(objectType).toArray(ofType: objectType)
            
            try realm.write({
                realm.delete(allRecord)
            })
            
        }catch _ {
            
            print("Error When deleteAllRecordOfCurrentObject")
        }
    }
    
    func eraseAllDatabase(){
        do{
            try realm.write({
                realm.deleteAll()
                Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
            })
            
            
        }catch _ {
            
            print("Error When eraseAllDatabase")
        }
    }
}



//---------------------------- END ---------------------------------//



