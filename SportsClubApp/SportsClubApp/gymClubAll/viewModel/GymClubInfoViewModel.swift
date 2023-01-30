//
//  GymClubInfoViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 26.01.2023.
//

import Foundation

class GymClubInfoViewModel : ObservableObject {
    @Published var gymClubInfos = [GymClubInfoVM]()
    
    func gymClubInfosService() async {
        do {
            await  GymClubInfoService.gymClubInfoService
                .getgymClubInfos { (response:Result<[GYMSportInfo],Error>) in
                    switch response {
                    case .success(let list):
                        DispatchQueue.main.async {
                            self.gymClubInfos = list.map(GymClubInfoVM.init)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.gymClubInfos = []
                            print(error)
                        }
                    }
                }
        }
    }
    
}

struct GymClubInfoVM : Identifiable,Equatable,Hashable {
    static func == (lhs: GymClubInfoVM, rhs: GymClubInfoVM) -> Bool {
        return true
    }
    
    let gymClubInfo : GYMSportInfo
    
    var id : String {
        gymClubInfo._id!
    }
    
    var imageName : String {
        gymClubInfo.imageName!
    }
    
    var name : String {
        gymClubInfo.name!
    }
}
