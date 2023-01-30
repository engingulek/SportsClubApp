//
//  GymCreateService.swift
//  SportsClubApp
//
//  Created by engin gülek on 30.01.2023.
//

import Foundation
import Alamofire
class GymCreateService {
    static let gymCreateService = GymCreateService()
    
    func createGymService(parameters :Parameters) async {
        print("createService 1")
        do {
          
            print("Service para \(parameters)")
            BaseApi.baseApi.sendData(target: .createGymClub(parameters)) { (response:Result<String,Error>) in
                switch response {
                case .success(let a):
                    print("Success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        }
    }
}
