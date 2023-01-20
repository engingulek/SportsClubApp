//
//  ExtensionMessageHomePage.swift
//  SportsClubApp
//
//  Created by engin gülek on 20.01.2023.
//

import SwiftUI

extension MessageHomePageView {
    //MARK : -MessageHomePageUser Desing
    
    
    var incomingMessageHP : some View {
        VStack(alignment : .leading) {
            HStack {
                Image("profilImage")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: UIScreen.screenWidth/9,height:
                            UIScreen.screenHeight/9)
                    .padding([.leading,.trailing])
                
               
                VStack(alignment : .leading) {
                    Text("Jack Kate")
                        .font(.system(size: 16,weight: .bold))
                    Text("Last message will go here")
                        .font(.system(size: 15))
                }
                  
                Spacer()
                HStack {
                    Text("29h")
                        .font(.system(size: 13,weight: .semibold))
                        
                    Image(systemName: "trash.circle.fill")
                        .font(.system(size: 18,weight: .semibold))
                        .padding(.trailing)
                        .foregroundColor(.red)
                        .onTapGesture {
                            print("Delete Message")
                        }
                }
            }
            
            
            Divider()
                .frame(minHeight: 2)
        }.padding(.horizontal)
    }
}
