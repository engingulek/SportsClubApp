//
//  User.swift
//  SportsClubApp
//
//  Created by engin gülek on 25.01.2023.
//

import Foundation

struct User: Identifiable,Codable {
    var id : String {
        return "_id"
    }
    let userId:String?
    let email:String?
    let nameSurnma:String?
}
