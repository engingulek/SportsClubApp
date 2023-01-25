//
//  HomePageService.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation

class HomePageService {
    static let homePageService = HomePageService()
    
    func getNearByGymClubService(completion:@escaping(Result<[GymClub],Error>)->()) async {
        do {
            BaseApi.baseApi.fetchData( target: .gymClubs, responseClass: GymClub.self) { (response:Result<[GymClub]?,Error>) in
                switch response {
                case .success(let list):
                    completion(.success(list!))
                    print("ServiceVeri geldi \(list)")
                case .failure(let error):
                    completion(.failure(error))
                    print("Service Veri Gelmedi \(error)")
                }
                
            }
        }
       
    }
}
