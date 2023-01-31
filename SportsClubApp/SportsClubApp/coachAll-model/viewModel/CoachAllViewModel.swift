//
//  CoachAllViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.01.2023.
//

import Foundation
class CoachAllListViewModel : ObservableObject {
    @Published var coachs  = [CoachAllViewModel]()
    @Published var coachsBest  = [CoachAllViewModel]()
    @Published var coachsSearch  = [CoachAllViewModel]()
    
    
    func coachAllService() async {
        do{
            await CoachAllService.coachAllService.getCoachAllService {  (response:Result<[Coach],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        let userId = UserDefaults.standard.string(forKey: "uid")
                        self.coachs = list.map(CoachAllViewModel.init).filter{
                            $0.createUserId != userId
                        }
                        
                        self.coachsBest = list.map(CoachAllViewModel.init).sorted{
                            $0.reting > $1.reting
                        }
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.coachs = []
                        
                    }
                }
                
            }
        }
    }
    
    func searchCoachAll(searchText:String) async {
        await coachAllService()
        self.coachsSearch = coachs.filter{ $0.name.uppercased().contains(searchText)}
    }
}




struct CoachAllViewModel: Identifiable {
    let coach : Coach
    
    var id : String {
        coach._id!
    }
    
    var createUserId : String {
        coach.createUserId!
    }
    
    var  imageUrl  :String{
        coach.imageURL!
    }
    
    var  name : String {
        coach.name!
    }
    
    var category : Category {
        coach.category!
    }
    
    var location : CoachLocation {
        coach.location!
    }
    
    var destination : String {
        coach.destination!
    }
    
    var reting : Double {
        coach.rating!
    }
    
    var payPeriod : ClubPayPeriod{
        coach.payPeriod!
    }
    
  
    

}
