//
//  GymClubAllViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 26.01.2023.
//

import Foundation

class GymClubAllViewModel : ObservableObject {
    @Published  var gymClubs = [GymClubAllVM]()
    
    func getGymClubAll() async {
        do {
     await GymClubAllService.gymClubAllService.getGymAllService(completion : {(response:Result<[GymClub],Error>) in
                 switch response {
                 case .success(let list):
                     DispatchQueue.main.async {
                         self.gymClubs = list.map(GymClubAllVM.init)
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
    var comment : [Comment]{
        gymClub.comment!
    }
    var registeredUsers : [User] {
        gymClub.registeredUsers!
    }
    
    
    
}
