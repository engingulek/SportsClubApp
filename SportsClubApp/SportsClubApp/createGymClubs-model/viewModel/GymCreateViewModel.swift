//
//  GymCreateViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 30.01.2023.
//

import Foundation
import Alamofire
class GymCreateViewModel : ObservableObject  {
    
    func gymCreateService(newGymClub :GymClub) async {
        var params : Parameters = [:]
        /**
         
         imageUrl : req.body.imageUrl,
         name : req.body.name,
         rating : req.body.rating,
         location : req.body.location,
         gymSportInfo : req.body.gymSportInfo,
         destination : req.body.destination,
         startClock : req.body.startClock,
         finishClock : req.body. finishClock,
         payPeriod : req.body.payPeriod,
         comment : req.body.comment,
         registeredUsers  : req.body.registeredUsers
         
         */
        var gymClubInfos = [[String:Any]]()
        for gymClub in newGymClub.gymSportInfo! {
            let gymClubInfo : [String:Any] = [
                "_id" : gymClub._id!,
                "imageName" : gymClub.imageName!,
                "name" : gymClub.name!
                ]
            gymClubInfos.append(gymClubInfo)

        }
        
        print("Denme json data \(gymClubInfos)")

      
        
       
       params = [ "createUserId" : newGymClub.createUserId!,
                  "name" : newGymClub.name!,
                   "imageUrl" :newGymClub.imageUrl!,
                   "rating" : newGymClub.rating!,
                   "location" : [
                    "latitude" : newGymClub.location!.latitude!,
                    "longitude" : newGymClub.location!.longitude!,
                    "city" : newGymClub.location!.city!,
                    "state" : newGymClub.location!.state!
                   ],
                   "gymSportInfo" : gymClubInfos,
                   "destination" : newGymClub.destination!,
                   "startClock" :newGymClub.startClock!,
                   "finishClock" :newGymClub.finishClock!,
                   "payPeriod" : [
                    "pay" : newGymClub.payPeriod!.pay!,
                    "period" : newGymClub.payPeriod!.period!
                   ],
                 
        ]
       
        do{
            await GymCreateService.gymCreateService.createGymService(parameters: params)
        }
    }
}
