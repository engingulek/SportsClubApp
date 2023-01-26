//
//  ApiCaller.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation
import Alamofire

enum Network : String {
case gymClubs = "gymClubs"
case gymClubInfos = "gymClubInfos"
}

extension Network: TargetType {
    
    
    var baseURL: String {
       
        return "http://localhost:3000/"
    }
    
    var path: String {
        switch self {
        case .gymClubs:
            return "gymClubs"
        case .gymClubInfos:
            return "gymClubInfos"
        }
    }
    var method: AlamofireMethod  {
        switch self {
        case .gymClubs:
            return .get
        case .gymClubInfos:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .gymClubs:
            return .requestPlain
        case .gymClubInfos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}


/*enum GetRouter : String {
case baseUrl = "http://localhost:3000/"
case gymClubs = "gymClubs"
}

enum : String{
    
}

struct ApiCaller {
    static let shared = ApiCaller()
    
}*/
