//
//  CoachService.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.01.2023.
//

import Foundation

class CoachAllService {
    
    static let coachAllService = CoachAllService()
    
    func getCoachAllService(completion:@escaping(Result<[Coach],Error>)->()) async {
        do {
            BaseApi.baseApi.fetchData( target: .coachs, responseClass: Coach.self) { (response:Result<[Coach]?,Error>) in
                switch response {
                case .success(let list):
                    completion(.success(list!))
                    print("ServiceVeri geldi coach \(list)")
                case .failure(let error):
                    completion(.failure(error))
                    print("Service Veri Gelmedi  coach \(error)")
                }
                
            }
        }
    }
    
    
  
}
