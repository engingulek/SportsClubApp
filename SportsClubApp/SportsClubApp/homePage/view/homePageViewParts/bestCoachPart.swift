//
//  bestCoachPart.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI
import Kingfisher
struct bestCoachPart: View {
    var coach : CoachAllViewModel
    var body: some View {
        VStack(spacing:15) {
            ZStack(alignment : .topTrailing) {
                KFImage(URL(string: coach.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170,height: 170)
                    .cornerRadius(15)
                HStack {
                    Image(systemName: "star.fill")        
                        .foregroundColor(.orange)
                    Text("\(String(format: "%.1f", coach.reting))/5")
                        .font(.system(size: 14))
                }.frame(width: 80,height: 30)
                .background()
                    .cornerRadius(10)
                    .font(.system(size: 14))
                    
            }
            VStack {
                Text("\(coach.name)")
                    .font(.system(size: 17,weight: .semibold))
                Text("\(coach.category.name)")
                    .font(.system(size: 16,weight: .light))
            }
           
        }.foregroundColor(.black)
    }
}


