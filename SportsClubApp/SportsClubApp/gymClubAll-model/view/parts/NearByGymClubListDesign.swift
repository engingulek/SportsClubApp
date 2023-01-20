//
//  NearByGymClubListDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct NearByGymClubListDesign: View {
    var body: some View {
        HStack {
       
            ZStack(alignment:.topLeading) {
                Image("gymClubsOne")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth/2,height: UIScreen.screenHeight / 7)
                    .cornerRadius(25)
                    .padding(.leading)
                    .padding(.top)
             
                    
            }.padding(.horizontal)
           
            VStack(spacing:10) {
                Text("LifeTime GYM")
                    .font(.system(size: 15,weight: .bold))
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                Text("LS,USA")
                    .font(.system(size: 15,weight: .semibold))
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("3.5/5")
                        .font(.system(size: 12))
                }
            }.padding(.horizontal)
            
            
            Spacer()
        }
        
    }
}

struct NearByGymClubListDesign_Previews: PreviewProvider {
    static var previews: some View {
        NearByGymClubListDesign()
    }
}
