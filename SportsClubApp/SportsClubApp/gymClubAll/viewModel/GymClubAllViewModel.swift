//
//  GymClubAllViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 26.01.2023.
//

import Foundation

// MARK: -GymClubAll Service
class GymClubAllViewModel : ObservableObject {
    @Published  var gymClubs = [GymClubAllVM]()
    @Published  var gymClubsSearch = [GymClubAllVM]()
    @Published var  gymClubsFilter = [GymClubAllVM]()
   
    
    func gymClubService() async {
        do {
     await GymClubAllService.gymClubAllService.getGymAllService(completion : {(response:Result<[GymClub],Error>) in
                 switch response {
                 case .success(let list):
                     DispatchQueue.main.async {
                         let userId = UserDefaults.standard.string(forKey: "uid")
                         self.gymClubs = list.map(GymClubAllVM.init).filter{$0.createUserId != userId }
                         
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
    
    
    func getGymClubAll() async {
        await gymClubService()
     }
    
    func searchGymClubAll(searchText:String) async {
        await gymClubService()
        self.gymClubsSearch = gymClubs.filter{ $0.name.uppercased().contains(searchText)}
    }
    
    func filterGymClubAll(filterGymClubInfo :GymClubInfoVM) async {
        await gymClubService()

        // Didn't work
    
       /*self.gymClubsFilter =   gymClubs.filter{
           $0.gymSportInfo.map( GymClubInfoVM.init).contains( filterGymClubInfo)
        }*/
        
        self.gymClubsFilter = []
        if filterGymClubInfo.imageName == "all" {
            self.gymClubsFilter = self.gymClubs
        }else{
            for gymClub in gymClubs {
                for a in gymClub.gymSportInfo {
                    if a._id == filterGymClubInfo.id {
                        self.gymClubsFilter.append(gymClub)
                    }
                }
            }
        }

    }
 }

struct GymClubAllVM : Identifiable {
    
    
    let gymClub : GymClub
    
    var id : String {
        gymClub._id!
    }
    
    
    var createUserId: String {
        gymClub.createUserId!
    }
    var  imageUrl  :String{
        gymClub.imageUrl!
    }
    var  name : String {
        gymClub.name!
    }
    var  rating : Double {
        gymClub.rating!
    }
    var location : Location{
        gymClub.location!
    }
    var gymSportInfo : [GYMSportInfo]{
        gymClub.gymSportInfo!
    }
    var destination : String{
        gymClub.destination!
    }
    var startClock : String{
        gymClub.startClock!
    }
    var finishClock: String{
        gymClub.finishClock!
    }
    var payPeriod : ClubPayPeriod{
        gymClub.payPeriod!
    }
 
    
    
    
}
