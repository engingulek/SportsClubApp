//
//  ApiCaller.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation
import Alamofire

enum Network {
    
    
case gymClubs
case gymClubInfos
case createGymClub(Parameters)
case userGymClubAdver(Parameters)
case coachs
case coachsCategory
//case createGymClub(Dictionary<String, Any>) = "createGymClub"
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
        case .createGymClub(_):
            return "createGymClub"
        case .userGymClubAdver(_):
            return "userGymAdvert"
        case .coachs:
            return "coachs"
        
        case .coachsCategory:
            return "coachCategories"
        }
    }
    var method: AlamofireMethod  {
        switch self {
        case .gymClubs:
            return .get
        case .gymClubInfos:
            return .get
        case .createGymClub:
            return .post
        case .userGymClubAdver(_):
            return .post
        case .coachs:
            return .get
        case .coachsCategory:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .gymClubs:
            return .requestPlain
        case .gymClubInfos:
            return .requestPlain
        case .createGymClub(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        case .userGymClubAdver(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        case .coachs:
            return .requestPlain
        case .coachsCategory:
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
