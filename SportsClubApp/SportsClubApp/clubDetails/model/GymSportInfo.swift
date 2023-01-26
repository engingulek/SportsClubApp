//
//  GymSportInfo.swift
//  SportsClubApp
//
//  Created by engin gülek on 13.01.2023.
//

import Foundation
struct GYMSportInfo : Codable{
    let _id : String?
    let imageName : String?
    let name : String?
    
    init(_id:String,imageName: String, name: String) {
        self._id = _id
        self.imageName = imageName
        self.name = name
    }
    
    static func == (lhs:GYMSportInfo,rhs:GYMSportInfo) -> Bool {
        return lhs._id == rhs._id
    }
}
