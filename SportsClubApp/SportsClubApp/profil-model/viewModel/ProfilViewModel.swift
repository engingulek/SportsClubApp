//
//  ProfilViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.01.2023.
//

import Foundation

class ProfilViewModel : ObservableObject {
    @Published  var userGymClub = [GymClubAllVM]()
    
    
    func userGymClub() async {
        do{
            await ProfilService.profilService.getUserGymAdvertService(completion: {(response:Result<[GymClub],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        self.userGymClub = list.map(GymClubAllVM.init)
                    }
                case .failure(let error) :
                    DispatchQueue.main.async {
                        self.userGymClub = []
                        print("VM gelmedi veri \(error)")
                    }
                }
            })
        }
    }
}
