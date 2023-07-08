//
//  UserDefaultsDataSource.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import Foundation

class UserDefaultsDataSource{
    @PlainUserDefaultsBacked(key: "is_first_launch", defaultValue: true) static var isFirstLaunch
    :Bool
    
    @PlainUserDefaultsBacked(key: "user_name", defaultValue: "ganesh") static var userName:String
    
    @PlainUserDefaultsBacked(key: "counter", defaultValue: 0,storage: .standard) static var counter:Int
    
    @CodableUserDefaultsBacked(key: "notes", defaultValue: nil) static var notes: [NoteModel]?
}
