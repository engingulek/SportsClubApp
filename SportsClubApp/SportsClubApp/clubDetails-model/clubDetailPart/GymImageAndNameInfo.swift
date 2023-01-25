//
//  GymImageAndNameInfo.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI
import Kingfisher
struct GymImageAndNameInfo: View {
    var gymClub : GymClubAllVM
    var body: some View {
        VStack(spacing:45) {
            ZStack(alignment : .topTrailing) {
                KFImage(URL(string: gymClub.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .frame(height: UIScreen.screenHeight / 4)
                    
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("\(String(format: "%.1f", gymClub.rating))/5")
                        .font(.system(size: 14))
           
                    Divider().frame(minWidth: 1)
                        .fontWeight(.bold)
                        .background(.black)
                        .padding(.vertical,4)
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Remove Like Lisr")
                        }
                      
                }.frame(width: 100,height: 30)
                .background()
                    .cornerRadius(10)
                    .font(.system(size: 14))
            
                
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text(gymClub.name)
                        .font(.system(size: 18,weight: .semibold))
                    VStack {
                        Text("\(gymClub.location.state!) - \(gymClub.location.city!)")
                        Text("\(gymClub.startClock) - \(gymClub.finishClock)")
                    }.font(.system(size: 18,weight: .light))
                    
                        
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


