//
//  CoachListDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CoachListDesign: View {
    var body: some View {
        VStack{
         
            HStack {
                Image("coach")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth/3,height: UIScreen.screenHeight/6)
                    .cornerRadius(15)
                VStack(spacing:5) {
                    Text("Amy Amanda")
                        .font(.system(size: 18,weight: .bold))
                    HStack {
                        Text("Yoga")
                        Text("Fitness")
                    }.font(.system(size: 15,weight: .semibold))
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("3.5/5")
                            .font(.system(size: 14))
                    }
                }.padding(.horizontal)
               
              
            }
            Divider()
                .frame(minHeight: 1)
                .background(.black)
                .padding(.horizontal)
                .padding(.vertical)
        }
       
      
        
    }
}

struct CoachListDesign_Previews: PreviewProvider {
    static var previews: some View {
        CoachListDesign()
    }
}
