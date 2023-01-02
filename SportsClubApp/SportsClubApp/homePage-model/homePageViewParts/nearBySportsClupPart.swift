//
//  nearBySportsClupPart.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI

struct nearBySportsClupPart: View {
    var body: some View {
     
           
            ZStack (alignment:.bottomLeading){
                Image("gymClubsOne")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270,height: 200)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text("LifeTime GYM")
                        .font(.system(size: 18,weight: .semibold))
                    
                    Text("NYC,USA 09:00 - 18:00")
                        .font(.system(size: 14))
                }.foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        
    }
}

struct nearBySportsClupPart_Previews: PreviewProvider {
    static var previews: some View {
        nearBySportsClupPart()
    }
}
