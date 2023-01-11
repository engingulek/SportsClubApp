//
//  CreateGymClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI

struct CreateGymClubsView: View {
    @State private var gymName:String = ""
    @State private var mapView : Bool = false
  
    var body: some View {
        ScrollView {
           Image("selectImage")
                .resizable()
                .scaledToFill()
                .padding()
                .frame(width: UIScreen.screenWidth / 2)
                .padding()
            
            SecureField("Gym Name", text: $gymName)
                .asTextField(textContentType: .name)
     
            Text("Select Map")
            .fontWeight(.bold)
            .foregroundColor(.red)
            .onTapGesture {
                self.mapView = true
            }
            .sheet(isPresented: $mapView) {
                ChooseClubLocation()
            }
        }.navigationTitle("Create Gym Club")
            
           
    }
}


struct CreateGymClubsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGymClubsView()
    }
}
