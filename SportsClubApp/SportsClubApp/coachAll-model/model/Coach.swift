//
//  Coach.swift
//  SportsClubApp
//
//  Created by engin gülek on 5.01.2023.
//

import Foundation

struct Coach : Identifiable,Hashable,Codable {
    let id : String
    let imageURL : String
    let name : String
    let category : [Category]
    let rating:Double
    
   
}


