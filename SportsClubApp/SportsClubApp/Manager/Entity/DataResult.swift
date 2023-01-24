//
//  DataResult.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation

struct DataResult<T:Codable>:Codable {
    var list : [T]?
    var success : Int?
}
