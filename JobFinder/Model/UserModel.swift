//
//  User.swift
//  User
//
//  Created by Madhav Raj Verma on 09/01/22.
//

import Foundation

struct UserResponse :Decodable {
    let success :Bool
    let data:UserModel
}

struct UserModel : Decodable {
    let _id:String
    let name:String
    let email:String
    let role:String
    let userImage:String
    
}
