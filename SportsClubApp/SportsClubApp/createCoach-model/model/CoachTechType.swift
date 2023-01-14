//
//  CoachTechType.swift
//  SportsClubApp
//
//  Created by engin gülek on 14.01.2023.
//

import Foundation
struct CoachTechType : Identifiable,Hashable {
    let id  = UUID().uuidString
    let imageName : String
    let tech : String
}
