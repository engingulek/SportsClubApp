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
    let locations = [
        GymLocaiton(name: "LifeTime GYM", rank: 3.5, latitude: 40.722849, longitude: -73.893456),
 
        
        GymLocaiton(name: "Heathly GYM", rank: 3.0, latitude: 40.721809, longitude: -73.905965),
        
        GymLocaiton(name: "Dream GYM", rank: 4.0, latitude: 40.734037, longitude: -73.896546)
    ]
    
   
    
    @State private var region : MKCoordinateRegion
    
    /*@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:121.000, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))*/
    
  
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (locationManager.lastLocation?.coordinate.latitude)!, longitude: locallongitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @State private var searchText = ""
    var body: some View {
      
            ZStack {
            Map(coordinateRegion: $region, annotationItems: locations )
                { location in
                    MapAnnotation(coordinate: .init(latitude: location.latitude, longitude: location.longitude)) {
                        NavigationLink {
                            ClubDetailsView()
                        } label: {
                            NearGYMClupMapImage(gymLocation: location)
                        }
                    }
                } .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        
                        
                        HStack {
                            Image(systemName: "mappin")
                            Text("NYC,USA")
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
                                ForEach(0..<5) { _ in
                                    NavigationLink {
                                        ClubDetailsView()
                                    } label: {
                                        NearBySportsClubPartOnToMap()
                                            .foregroundColor(.black)
                                    }

                                    
                                }
                            }.padding(.horizontal)
                        }.frame(width:UIScreen.screenWidth)
                    }
                }
            }.navigationTitle("Look Map")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}


