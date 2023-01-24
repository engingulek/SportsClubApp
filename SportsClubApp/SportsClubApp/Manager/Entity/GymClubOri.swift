//
//  GymClubOri.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation

class GymClubOri : Identifiable, Equatable,Codable {
    static func == (lhs: GymClubOri, rhs: GymClubOri) -> Bool {
        return true
    }
    
    let id : String?
    let createUserId: String?
    let  imageUrl  :String?
    let  name : String?
    let  rating : Double?
    let destination : String?
    let startClock : String?
    let finishClock: String?
    
}
