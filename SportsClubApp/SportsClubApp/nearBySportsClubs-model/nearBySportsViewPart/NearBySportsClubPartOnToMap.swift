//
//  nearBySportsClubPartToMap.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI
import Kingfisher
struct NearBySportsClubPartOnToMap: View {
    @State var nearByGymClub : GymClubAllVM
    var body: some View {
        
        HStack {
            Spacer()
            ZStack(alignment:.topLeading) {
                KFImage(URL(string: nearByGymClub.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 150)
                    .cornerRadius(25)
            }
            
            VStack(alignment : .leading,spacing: 10) {
                Text(nearByGymClub.name)
                    .font(.system(size: 18,weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: UIScreen.screenWidth/4)
                
                
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("\(String(format: "%.1f", nearByGymClub.rating))/5")
                            .font(.system(size: 15))
                    }  .multilineTextAlignment(.center)
                
               
            }.padding(.horizontal)
            
            Spacer()
        }
        .background(.white)
        .cornerRadius(20)
            
           
    }
}

/*struct NearBySportsClubPartOnToMap_Previews: PreviewProvider {
    static var previews: some View {
        NearBySportsClubPartOnToMap(nearByGymClubs: .init(gymClub: .encode(self)))
    }
}*/
