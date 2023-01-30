//
//  GymCreateViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 30.01.2023.
//

import Foundation
import Alamofire
class GymCreateViewModel : ObservableObject  {
    
    func gymCreateService(parameters :Parameters) async {
        do{
            await GymCreateService.gymCreateService.createGymService(parameters: parameters)
        }
    }
}
