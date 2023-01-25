//
//  NearBySportsClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI
import MapKit


struct NearBySportsClubsView: View {
  
    @StateObject var locationManager = LocationManager()
    @State var nearByGymClubs : [GymClubAllVM]
   
    @State private var searchText = ""
   @State private var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    var body: some View {
    
            ZStack {
                
              
                
                Map(coordinateRegion: $mapRegion, annotationItems: nearByGymClubs )
                { location in
                    MapAnnotation(coordinate: .init(latitude: location.location.latitude!, longitude: location.location.longitude!)) {
                        NavigationLink {
                            ClubDetailsView(gymClub: location)
                        } label: {
                            NearGYMClupMapImage(gymClub: location)
                        }
                    }
                } .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        
                        
                        HStack {
                            Image(systemName: "mappin")
                            Text("\(locationManager.city) / \(locationManager.state)")
                        } .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .font(.system(size: 18,weight: .semibold))
                       
                      

                        
                    }.padding(.horizontal)
                    Spacer()
                    VStack(alignment:.trailing) {
                        NavigationLink {
                            NearByGymClubsListView()
                        } label: {
                            Text("All Gym List")
                                .padding()
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }.padding(.trailing)
                        ScrollView(.horizontal) {
                            HStack(spacing:10) {
                                ForEach(nearByGymClubs) { nearByGymClub in
                                    NavigationLink {
                                        ClubDetailsView(gymClub: nearByGymClub)
                                    } label: {
                                        NearBySportsClubPartOnToMap(nearByGymClub: nearByGymClub)
                                            .foregroundColor(.black)
                                    }

                                    
                                }
                            }.padding(.horizontal)
                        }.frame(width:UIScreen.screenWidth)
                    }
                }
            }.navigationTitle("Look Map")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (locationManager.lastLocation?.coordinate.latitude)!,longitude: (locationManager.lastLocation?.coordinate.longitude)!), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
                print(region.center.longitude)
                print(region.center.latitude)
                self.mapRegion = region
                print("Şehir \(locationManager.city)")
                
            }
        
    }
}


