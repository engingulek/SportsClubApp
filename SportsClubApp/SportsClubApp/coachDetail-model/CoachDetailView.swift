//
//  CoachDetail.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CoachDetailView: View {
    var body: some View {
        ScrollView {
            VStack(spacing:5) {
                ZStack(alignment : .bottomTrailing) {
                    
                    Image("coach")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.screenHeight / 4)
                        .clipShape(Circle())
                    
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Remove Like Lisr")
                        }
                }
                
                Text("Amy Amanda")
                Text("Yoga")
                HStack {
                    Image(systemName: "mappin")
                    Text("NYC,USA")
                }.font(.system(size: 18,weight: .semibold))
                
                Divider()
                    .frame(minHeight: 1)
                    .background(.black)
                    .padding(.horizontal)
                    .padding(.vertical)
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("3.5/5")
                    }.frame(width: 80,height: 30)
                        .font(.system(size: 14))
                   
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                        Text("$50 per hours")
                    }.frame(height: 30)
                        .font(.system(size: 14))
                }
                Divider()
                    .frame(minHeight: 1)
                    .background(.black)
                    .padding(.horizontal)
                    .padding(.vertical)
             
                
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five .")
                          .font(.system(size: 15,weight: .light))
                          .padding(.horizontal)
          
                      NavigationLink {
                          Text("Message Page")
                      } label: {
                          VStack{
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
        }.navigationTitle("Coach Detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CoachDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoachDetailView()
    }
}
