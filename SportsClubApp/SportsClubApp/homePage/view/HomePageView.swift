//
//  HomePageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI
import CoreLocation

struct HomePageView: View {
    @ObservedObject var homePageViewModel = HomePageViewModel()
 
    @State private var searchText = ""
    @StateObject var locationManager = LocationManager()

    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack(spacing: 10) {
              
                        VStack(spacing:5) {
                            Text("Welcome")
                                .font(.system(size: 25,weight: .bold))
                            
                            Text("Jhon Jean")
                                .font(.system(size: 20))
                        }
                        
                    
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
                                Text("Look At Map")
                                    .font(.system(size: 13,weight: .semibold))
                                    .foregroundColor(.black)
                            }
                            
                                
                        }.padding(.horizontal)
                            
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:20) {
                                ForEach(homePageViewModel.nearByGymClub,id: \.id) { gymClub in
                                    NavigationLink {
                                        ClubDetailsView()
                                    } label: {
                                    nearBySportsClupPart(gymClub: gymClub)
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
                            NavigationLink {
                                CoachAllView()
                            } label: {
                                Text("See All")
                                    .font(.system(size: 13,weight: .semibold))
                            }.foregroundColor(.black)
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
                .toolbar {
                    ToolbarItemGroup(placement:
                            .navigation) {
                                NavigationLink {
                                    ProfilView()
                                } label: {
                                    Image(systemName: "person.crop.circle.fill")
                                         .font(.system(size: 25))
                                         .foregroundColor(.black)
                                }
                    }
                    
                    ToolbarItemGroup(placement:
                            .primaryAction) {
                                NavigationLink {
                                    MessageHomePageView()
                                } label: {
                                    ZStack(alignment: .topTrailing) {
                                        Image(systemName: "location")
                                             .font(.system(size: 25))
                                             .foregroundColor(.black)
                                        Text("1")
                                            
                                            .frame(width: 20,height: 20)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .background(.black)
                                            .clipShape(Circle())

                                    }
                                   
                                }
                    }
                }
        }.task {
            await homePageViewModel.getNearByGymClub(localLocation : locationManager.lastLocation!)
            
        }
    }
}

//
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
            HomePageView()
    }
}
