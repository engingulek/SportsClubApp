//
//  nearBySportsClubPartToMap.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI

struct NearBySportsClubPartOnToMap: View {
    var body: some View {
        
        HStack {
            Spacer()
            ZStack(alignment:.topLeading) {
                Image("gymClubsOne")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 150)
                    .cornerRadius(25)
                   
                 
                
                Image(systemName: "heart")
                    .frame(width: 35,height: 35)
                    .foregroundColor(.red)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                    .padding(.vertical)
                    .padding(.horizontal)
            }
            
            VStack(alignment : .leading,spacing: 10) {
                Text("LifeTime GYM")
                    .font(.system(size: 18,weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: UIScreen.screenWidth/4)
                
                
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("3.5/5")
                            .font(.system(size: 15))
                    }  .multilineTextAlignment(.center)
                
               
            }.padding(.horizontal)
            
            Spacer()
        }
        .background(.white)
        .cornerRadius(20)
            
           
    }
}

struct NearBySportsClubPartOnToMap_Previews: PreviewProvider {
    static var previews: some View {
        NearBySportsClubPartOnToMap()
    }
}
