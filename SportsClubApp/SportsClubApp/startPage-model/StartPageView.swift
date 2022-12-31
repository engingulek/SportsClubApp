//
//  StartPageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct StartPageView: View {
    @State var showHomePage = false
    @State var showLoginPage = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    var body: some View {
        NavigationView {
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
                    
                    
                    Button("Get Started", action: {
                        self.showHomePage = true
                    })
                    .fullScreenCover(isPresented: $showHomePage, content: {
                        Text("Home Page")
                    })
                    .buttonStyle(StartPageButtonStyle(foregroundColor: .black, backgroundColor: .white))
                    
                    
                    
                    NavigationLink {
                        LoginPageView()
                    } label: {
                        Text("Loginn")
                            
                    }
                    .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                    .padding()
                   
                }
                
            }.navigationTitle("Sports Club")
        }
    }
}





struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}