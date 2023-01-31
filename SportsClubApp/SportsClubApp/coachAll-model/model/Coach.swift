//
//  Coach.swift
//  SportsClubApp
//
//  Created by engin gülek on 5.01.2023.
//

import Foundation

struct Coach : Codable {
    let _id : String?
    let createUserId: String?
    let imageURL : String?
    let name : String?
    let category : Category?
    let location : CoachLocation?
    let destination : String?
    let rating:Double?
    let payPeriod : ClubPayPeriod?
    let comment : [Comment]?
    let registeredUsers : [User]?
    
   
}


struct CoachLocation : Codable , Hashable {
    let city : String?
    let state : String?
}


