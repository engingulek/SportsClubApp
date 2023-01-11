//
//  LikesPage.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI




struct LikesPage: View {
    
    @State var gymClubs : [GymClub] = [
         .init(id: "0", imageURL: "gymClubsTwo", name: "LifeTime Gym", country: "USA", city: "NYC", rating: 3.0),
         .init(id: "1", imageURL: "gymClubsTwo", name: "LifeTime Gym", country: "USA", city: "NYC", rating: 3.0),
         .init(id: "2", imageURL: "gymClubsTwo", name: "LifeTime Gym", country: "USA", city: "NYC", rating: 3.0),
         .init(id: "3", imageURL: "gymClubsTwo", name: "LifeTime Gym", country: "USA", city: "NYC", rating: 3.0)
     ]

    @State var coachs : [Coach] = [
         .init(id: "0", imageURL: "coach", name: "Amanda Tree", category: [
             .init(id: 0, categoryName: "Yoga"),
             .init(id: 1, categoryName: "Fitness")
         ], rating: 3.5)
     ]
    
    var body: some View {
     
        List {
            Section {
                ForEach(gymClubs) { gymClub in
                    NearByGymClubListDesign()
                        
                        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight/8)
                        .padding()
                    
                }.onDelete(perform: deleteGymClubLike)
                
            } header: {
                Text("Gym Clubs")
            }
            
            Section {
                ForEach(coachs) { coach in
                    CoachListDesign()
                        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight/8)
                }.onDelete(perform: deleteCoachLike)
            } header: {
                Text("Coach")
            }
        }
    }
    
    func deleteGymClubLike(at offsets : IndexSet){
        gymClubs.remove(atOffsets: offsets)
    }
    
    func deleteCoachLike(at offsets : IndexSet){
        coachs.remove(atOffsets: offsets)
    }
}


struct LikesPage_Previews: PreviewProvider {
    static var previews: some View {
        LikesPage()
    }
}
