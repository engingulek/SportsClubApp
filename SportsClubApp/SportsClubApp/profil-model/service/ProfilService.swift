//
//  ProfilService.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.01.2023.
//

import Foundation
import Alamofire
class ProfilService {
    static let profilService = ProfilService()
    
    func getUserGymAdvertService(completion:@escaping(Result<[GymClub],Error>)->()) async {
        do {
            let userId = UserDefaults.standard.string(forKey: "uid")
            var params : Parameters = [:]
            params = [
                "createUserId" : userId!
            ]
            
            BaseApi.baseApi.fetchData(target: .userGymClubAdver(params), responseClass: GymClub.self) { (response:Result<[GymClub]?,Error>) in
                switch response {
                case .success(let gymClubList):
                    completion(.success(gymClubList!))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        }
    }
}
