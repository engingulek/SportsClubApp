//
//  bestCoachPart.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI

struct bestCoachPart: View {
    var body: some View {
        VStack(spacing:15) {
            ZStack(alignment : .topTrailing) {
                Image("coach")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170,height: 170)
                    .cornerRadius(15)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("3.5/5")
                        .font(.system(size: 14))
                }.frame(width: 80,height: 30)
                .background()
                    .cornerRadius(10)
                    .font(.system(size: 14))
                    
            }
                
            Text("Amy Kate")
                .font(.system(size: 17,weight: .semibold))
        }
    }
}

struct bestCoachPart_Previews: PreviewProvider {
    static var previews: some View {
        bestCoachPart()
    }
}
