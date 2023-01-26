//
//  GymClub.swift
//  SportsClubApp
//
//  Created by engin gülek on 5.01.2023.
//

import Foundation


struct GymClub :Codable {
    
    static func == (lhs: GymClub, rhs: GymClub) -> Bool {
        return true
    }
    
    let _id: String?
    let createUserId: String?
    let  imageUrl  :String?
    let  name : String?
    let  rating : Double?
    let location : Location?
    let gymSportInfo : [GYMSportInfo]?
    let destination : String?
    let startClock : String?
    let finishClock: String?
    let payPeriod : ClubPayPeriod?
    let comment : [Comment]?
    let registeredUsers : [User]?
    
}


struct ClubPayPeriod:Codable,Hashable {
    let pay : Double?
    let period : String?
    
}

struct Comment : Codable,Hashable,Identifiable {
    var id:String?
    
    let nameSurname : String?
    let date: String?
    let rating : Double?
    let comentText : String?
}


