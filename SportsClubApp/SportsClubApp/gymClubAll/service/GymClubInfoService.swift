//
//  GymSportInfoViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 26.01.2023.
//

import Foundation

class GymClubInfoService {
    static let gymClubInfoService = GymClubInfoService()
    
    func getgymClubInfos(completion:@escaping(Result<[GYMSportInfo],Error>)->()) async{
        do {
            BaseApi.baseApi.fetchData(target: .gymClubInfos, responseClass: GYMSportInfo.self) { (response:Result<[GYMSportInfo]?,Error>) in
                switch response {
                case .success(let list):
                    completion(.success(list!))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
}
