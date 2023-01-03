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
                    .frame(width: UIScreen.screenWidth/2,height: UIScreen.screenHeight / 6.5)
                    .cornerRadius(25)
                Image(systemName: "heart")
                    .frame(width: 35,height: 35)
                    .foregroundColor(.red)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                    .padding(.vertical)
                    .padding(.horizontal)
            }.padding(.horizontal)
           
            VStack(spacing:10) {
                Text("LifeTime GYM")
                    .font(.system(size: 15,weight: .bold))
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
