//
//  StartPageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct StartPageView: View {
    var body: some View {
        ZStack {
      Image("startPage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        
            VStack() {
                Spacer()
                Text("I like the smart, agile and at the same time moral person of the athlete.")
                    .font(.system(size: 30,weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)

                Text("Mustafa Kemal ATATÜRK")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding(.horizontal)
                
                
                Button("Get Started", action: { })
                    .buttonStyle(StartPageButtonStyle(foregroundColor: .black, backgroundColor: .white))
                
                Button("Login", action: { })
                    .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                    .padding()
                            
                            
                /*Button {
                    Text("Get Started")
                } label: {
                    Text("Get Started")
                        .frame(width: 300)
                        .padding(.vertical)
                        
                       
                }.background(.white)
                 .padding(.vertical)*/
              
                    

            }
            
        }
    }
}





struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
