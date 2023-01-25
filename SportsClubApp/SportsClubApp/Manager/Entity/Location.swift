//
//  Location.swift
//  SportsClubApp
//
//  Created by engin gülek on 25.01.2023.
//

import Foundation
import CoreLocation


struct Location : Identifiable,Hashable , Codable{
    var id : String {
        return "_id"
    }
    let latitude : Double?
    let longitude : Double?
    let city : String?
    let state : String?
}




