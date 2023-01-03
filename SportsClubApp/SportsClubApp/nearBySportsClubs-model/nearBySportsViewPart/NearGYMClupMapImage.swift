//
//  NearGYMClupMapImage.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI



struct NearGYMClupMapImage: View {
    
    let gymLocation : GymLocaiton
    
    var body: some View {
        VStack {
            Image("gymClubsOne")
                .resizable()
                .frame(width: 60, height: 40)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(gymLocation.name)
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
