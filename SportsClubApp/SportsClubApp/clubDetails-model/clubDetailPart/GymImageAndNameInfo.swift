//
//  GymImageAndNameInfo.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct GymImageAndNameInfo: View {
    var body: some View {
        VStack(spacing:45) {
            ZStack(alignment : .topTrailing) {
                Image("gymClubsOne")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .frame(height: UIScreen.screenHeight / 4)
                    
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("3.5/5")
                        .font(.system(size: 14))
                }.frame(width: 80,height: 30)
                .background()
                    .cornerRadius(10)
                    .font(.system(size: 14))
                    .padding(.horizontal)
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text("LifeTime GYM")
                        .font(.system(size: 18,weight: .semibold))
                    Text("NYC,USA  09:00 - 20:00")
                        .font(.system(size: 18,weight: .light))
                }
                Spacer()
                Text("1.5 Metre")
                    .font(.system(size: 15))
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct GymImageAndNameInfo_Previews: PreviewProvider {
    static var previews: some View {
        GymImageAndNameInfo()
    }
}
