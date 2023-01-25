//
//  NearGYMClupMapImage.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI
import Kingfisher


struct NearGYMClupMapImage: View {
    
    let gymClub : GymClubAllVM
    
    var body: some View {
        VStack {
            KFImage(URL(string: gymClub.imageUrl))
                .resizable()
                .frame(width: 60, height: 40)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(gymClub.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(.white)
                .foregroundColor(.black)
                .border(.white)
                .cornerRadius(4)
               
            
        }.shadow(radius: 5)
    }
}
