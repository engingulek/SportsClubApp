//
//  GymClub.swift
//  SportsClubApp
//
//  Created by engin gülek on 5.01.2023.
//

import Foundation

struct GymClub : Identifiable,Hashable , Codable {
    let id : String
    let imageURL : String
    let name : String
    let country :String
    let city : String
    let rating : Double
    
    init(id: String, imageURL: String, name: String, country: String, city: String, rating: Double) {
        self.id = id
        self.imageURL = imageURL
        self.name = name
        self.country = country
        self.city = city
        self.rating = rating
    }
    
    
}
