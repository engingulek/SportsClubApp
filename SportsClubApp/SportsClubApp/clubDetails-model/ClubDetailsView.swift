//
//  ClubDetailsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct GYMSportInfo : Identifiable , Hashable{
    let id = UUID().uuidString
    let imageName : String
    let name : String
}

struct ClubDetailsView: View {
    private var gymSportInfo = [
        GYMSportInfo(imageName: "takeoutbag.and.cup.and.straw", name: "Drink"),
        GYMSportInfo(imageName: "figure.yoga", name: "Yoga"),
        GYMSportInfo(imageName: "basket", name: "Spor Shop"),
        
    ]
    var body: some View {
    
            ScrollView {
                VStack {
                    GymImageAndNameInfo()
               
                    Divider().frame(minHeight: 1)
                        .background(.black)
                    HStack(spacing:30) {
                        ForEach(gymSportInfo) { info in
                            VStack(spacing:5) {
                                Image(systemName: info.imageName)
                                    .font(.system(size: 25))
                                Text(info.name)
                                    .font(.system(size: 15))
                            }
                        }
                    }.padding(.vertical,5)
                    Divider().frame(minHeight: 1)
                        .background(.black)
                    
            
                  
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five .")
                            .font(.system(size: 15,weight: .light))
            
                        NavigationLink {
                            Text("Message Page")
                        } label: {
                            VStack{
                                Text("$130/month")
                                Text("Click for send message")
                            }
                        }
                        .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                        .padding()
                    
                    VStack(spacing:15) {
                        Text("Reviews")
                            .font(.system(size: 20,weight: .semibold))
                        ForEach(0..<4) { _ in
                            CommentDesign()
                        }
                        
                    }
                    
                    
                }
                    .padding(.horizontal)
                    .padding(.top,25)
            }.navigationTitle("Club Details")
                .navigationBarTitleDisplayMode(.inline)
           
        
    }
}

struct ClubDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailsView()
    }
}
