//
//  CoachListDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI
import Kingfisher
struct CoachListDesign: View {
    var coach : CoachAllViewModel
    var body: some View {
        VStack{
         
            HStack {
                KFImage(URL(string: coach.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth/3.5,height: UIScreen.screenHeight/7.5)
                    .cornerRadius(15)
                    .padding(.top)
                VStack(spacing:5) {
                    Text("\(coach.name)")
                        .font(.system(size: 18,weight: .bold))

                        
                        Text("\(coach.category.name)")
                    .font(.system(size: 15,weight: .semibold))
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("\(String(format: "%.1f", coach.reting))/5")
                            .font(.system(size: 14))
                    }
                }.padding(.horizontal)
               
              
            }
            Divider()
                .frame(minHeight: 1)
                .background(.black)
                .padding(.horizontal)
                .padding(.vertical,2)
        }
       
      
        
    }
}


