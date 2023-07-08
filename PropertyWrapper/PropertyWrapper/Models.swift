//
//  Models.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import Foundation

struct UserModel{
    @Capitalized var firstName:String
    @Capitalized var lastName:String
}

struct WrappedUserModel{
    var firstName:String
    var lastName:String
}


struct NoteModel:Codable{
    let title:String
}
