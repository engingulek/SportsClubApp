//
//  NearBySportsClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 2.01.2023.
//

import SwiftUI
import MapKit


struct NearBySportsClubsView: View {
    
    let locations = [
        GymLocaiton(name: "LifeTime GYM", rank: 3.5, latitude: 40.722849, longitude: -73.893456),
 
        
        GymLocaiton(name: "Heathly GYM", rank: 3.0, latitude: 40.721809, longitude: -73.905965),
        
        GymLocaiton(name: "Dream GYM", rank: 4.0, latitude: 40.734037, longitude: -73.896546)
    ]
    
    
    @State var mapRegion: MKCoordinateRegion
    init() {
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: .init(latitude: 40.722849, longitude: -73.893456), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }

    
    @State private var searchText = ""
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $mapRegion, annotationItems: locations )
            { location in
                MapAnnotation(coordinate: .init(latitude: location.latitude, longitude: location.longitude)) {
                    NearGYMClupMapImage(gymLocation: location)
                    
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
                    HStack {
                      Image(systemName: "magnifyingglass")
                        TextField("Search GYM Clubs", text: $searchText)
                            .onChange(of: searchText) { newValue in}
                    } .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .frame(width: 300)
                        .padding()
                    Spacer()
                }.padding(.horizontal)
                Spacer()
                ScrollView(.horizontal) {
                    HStack(spacing:10) {
                        ForEach(0..<5) { _ in
                            NearBySportsClubPartOnToMap()
                        }
                    }.padding(.horizontal)
                }.frame(width:UIScreen.screenWidth)
            }
        }
    }
}

struct NearBySportsClubsView_Previews: PreviewProvider {
    static var previews: some View {
        NearBySportsClubsView()
        
    }
}
