//
//  nearBySportsClupPart.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI
import Kingfisher
struct nearBySportsClupPart: View {
    var gymClub : GymClubAllVM
    var body: some View {
            ZStack (alignment:.bottomLeading){
                KFImage(URL(string: gymClub.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270,height: 200)
                    .cornerRadius(20)
                LinearGradient(gradient: Gradient(colors: [Color.clear,Color.black]), startPoint: .center, endPoint: .bottom)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text(gymClub.name)
                        .font(.system(size: 18,weight: .semibold))
                    
                    VStack(alignment: .leading) {
                        Text("\(gymClub.location.state!)-\(gymClub.location.city!)")
                        Text("\(gymClub.startClock) - \(gymClub.finishClock)  ")
                    }
                    .font(.system(size: 14))
                }.foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        
    }

  
  
}
