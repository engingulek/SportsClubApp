//
//  GymLocaiton.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import Foundation
struct GymLocaiton : Hashable,Identifiable {
    let id = UUID().uuidString
    let name:String
    let rank : Double
    let latitude,longitude : Double
}
