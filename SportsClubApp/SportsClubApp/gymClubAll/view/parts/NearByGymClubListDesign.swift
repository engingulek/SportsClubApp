//
//  NearByGymClubListDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI
import Kingfisher
struct NearByGymClubListDesign: View {
    var gymClub : GymClubAllVM
    var body: some View {
        HStack {
       
            ZStack(alignment:.topLeading) {
                KFImage(URL(string: gymClub.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth/2,height: UIScreen.screenHeight / 7)
                    .cornerRadius(25)
                    .padding(.leading)
                    .padding(.top)
             
                    
            }.padding(.horizontal)
           
            VStack(spacing:10) {
                Text(gymClub.name)
                    .font(.system(size: 15,weight: .bold))
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                VStack(alignment: .center) {
                    VStack {
                        Text("\(gymClub.location.state!)")
                        Text("\(gymClub.location.city!)")
                    }
                    
                    Text("\(gymClub.startClock) - \(gymClub.finishClock)  ")
                }
                .font(.system(size: 14))
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("\(String(format: "%.1f", gymClub.rating))/5")
                        .font(.system(size: 12))
                }
            }.padding(.horizontal)
            
            
            Spacer()
        }
        
    }
}


