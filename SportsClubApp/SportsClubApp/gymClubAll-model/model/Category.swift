//
//  Category.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import Foundation
struct Category : Identifiable,Hashable,Codable {
    let id : Int
    let categoryName : String
    
    
    init(id: Int, categoryName: String) {
        self.id = id
        self.categoryName = categoryName
    }
}
