//
//  HomePageViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation

class HomePageViewModel : ObservableObject {
    @Published var gymClubs = [GymClubOri]()
    
    func getNearByGymClub() async {
        do {
            await HomePageService.homePageService.getNearByGymClubService(completion : {(response:Result<[GymClubOri],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        self.gymClubs = list
                        print("Vm veri geldi \(list)")
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.gymClubs = []
                        print("VM gelmedi veri \(error)")
                    }
                }
                
            })
        }
    }
    
    
}
