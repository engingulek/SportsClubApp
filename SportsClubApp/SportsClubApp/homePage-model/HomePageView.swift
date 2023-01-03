//
//  HomePageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Location")
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "mappin")
                        Text("New York,USA")
                        Spacer()
                    }.font(.system(size: 20,weight: .semibold))
                    
                    Text("In this application, you can find the places where you can do sports close to you and the coaches you can take lessons from.").padding()
                    
                }.padding(.horizontal)
                
                    VStack {
                        HStack {
                            Text("Near by Sports Clubs")
                                .font(.system(size: 17,weight: .semibold))
                            Spacer()
                            NavigationLink {
                                NearBySportsClubsView()
                            } label: {
                                Text("See All")
                                    .font(.system(size: 13,weight: .semibold))
                                    .foregroundColor(.black)
                            }
                            
                                
                        }.padding(.horizontal)
                            
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:20) {
                                ForEach(0..<5) { _ in
                                    NavigationLink {
                                        ClubDetailsView()
                                    } label: {
                                        nearBySportsClupPart()
                                    }                                    
                                }
                            }.padding(.horizontal)
                        }
                    }.padding(.vertical)
                    
                    VStack {
                        HStack {
                            Text("Best Coachs")
                                .font(.system(size: 17,weight: .semibold))
                            Spacer()
                            Text("See All")
                                .font(.system(size: 13,weight: .semibold))
                        }.padding(.horizontal)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:20) {
                                ForEach(0..<5) { _ in
                                    NavigationLink {
                                        CoachDetailView()
                                    }label: {
                                        bestCoachPart()
                                    }
                                    
                                }
                            }.padding(.horizontal)
                        }
                    }
                
            }.navigationTitle("Home Page")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
     
            HomePageView()
        
    }
}
