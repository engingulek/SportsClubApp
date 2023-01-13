//
//  GymSportInfo.swift
//  SportsClubApp
//
//  Created by engin gülek on 13.01.2023.
//

import Foundation
struct GYMSportInfo : Identifiable,Hashable,Equatable{
    let id = UUID()
    let imageName : String
    let name : String
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
    
    static func == (lhs:GYMSportInfo,rhs:GYMSportInfo) -> Bool {
        return lhs.id == rhs.id
    }
}
