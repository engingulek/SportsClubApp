//
//  ClubDetailsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI
import CoreLocation

struct ClubDetailsView: View {
    var gymClub : GymClubAllVM
    @State  var commentViewState  = false
    @State var commentTextField = ""
    
     @State var textFieldCommentLimit = 275
     
     @State var textFieldCommentDecrase = 0
     
     @State var commentStatusCount = 0
    @StateObject var locationManager = LocationManager()
    @State var locationLenght = ""
    var body: some View {
        
        ZStack {
            ScrollView {
                viewDetails
                    .padding(.horizontal)
                    .padding(.top,25)
            }.navigationTitle("Club Details")
                .navigationBarTitleDisplayMode(.inline)
            commentViewState ?
            LinearGradient(gradient:
                            Gradient(colors:
                                        [Color.black.opacity(0.2),
                                         Color.black.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            : nil
            commentViewState ? commentViewDesign : nil
        }.task {
            let gymCordinate = CLLocation(latitude: gymClub.location.latitude!, longitude: gymClub.location.longitude!)
            let localLocation = CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude)!, longitude: (locationManager.lastLocation?.coordinate.longitude)!)
            
            
            locationLenght = "\(String(format: "%.2f", localLocation.distance(from: gymCordinate) / 1000))"
            print("Details \(locationManager.lastLocation?.coordinate.longitude)")
        }
    }
}




