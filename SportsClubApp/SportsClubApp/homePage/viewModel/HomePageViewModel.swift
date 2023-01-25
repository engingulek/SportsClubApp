//
//  HomePageViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation
import CoreLocation
import SwiftUI

class HomePageViewModel : ObservableObject {
    @Published private var gymClubs = [HomePageVM]()
    @Published var nearByGymClub = [HomePageVM]()

    
    // MARK: -Calculator the distance between local  and gym 
    func getNearByGymClub(localLocation:CLLocation) async {
       do {
    await HomePageService.homePageService.getNearByGymClubService(completion : {(response:Result<[GymClub],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        self.gymClubs = list.map(HomePageVM.init)
                        for gymClub in self.gymClubs {
                            let gymCordinate = CLLocation(latitude: gymClub.location.latitude!, longitude: gymClub.location.longitude!)
                            let locationLenght = localLocation.distance(from: gymCordinate) / 1000
                            
                            if locationLenght <= 1.5 {
                                self.nearByGymClub.append(gymClub)
                            }
                        }
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




struct  HomePageVM {
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
