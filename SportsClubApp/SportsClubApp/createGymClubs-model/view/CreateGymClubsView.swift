//
//  CreateGymClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI
import MapKit

struct Contact: Identifiable {
    let id = UUID()
    let name: String
}

struct CreateGymClubsView: View {
    @State private var gymName:String = ""
    @State private var city:String = ""
    @State private var country:String = ""
    @State var cityAndCountryVisible = false
    @State private var mapView : Bool = false
    @State var mapRegion: MKCoordinateRegion
    @State var pressLocation = CGPoint.zero
    @State var selectLocation = ChoseGymMapLocation(markerType: "selectLocation", latitude: 40.722849, longitude: -73.893456)
    @State var openTime = Date()
    @State var closeTime = Date()
    @State var selectedTypeGymClub: String?
    @State var multiTypeGymClubSelection = Set<UUID>()
    @State var editMode: EditMode = .active
     var typeGymClubList:[GYMSportInfo] = [
        .init(imageName: "takeoutbag.and.cup.and.straw", name: "Drink"),
        .init(imageName: "figure.yoga", name: "Yoga"),
        .init(imageName: "basket", name: "Spor Shop"),
     
    ]
    
    
    init() {
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: .init(latitude: 40.722849, longitude: -73.893456), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        getCityAnbCountry(latitude:40.722849 , longitude: -73.893456)
        
        
    }
    
    @State var locations = [
           ChoseGymMapLocation(markerType: "userLocation", latitude: 40.722849, longitude: -73.893456),
          ]
    
 
    var body: some View {
        
        ScrollView {
          
            
            
            VStack {
                
                Image("selectImage")
                     .resizable()
                     .scaledToFill()
                     .padding()
                     .frame(width: UIScreen.screenWidth / 2)
                     .padding()
                 
                 SecureField("Gym Name", text: $gymName)
                     .asTextField(textContentType: .name)
                
                Text("Select Gym Location")
                    .font(.system(size: 20))
                
                ZStack(alignment:.topLeading) {
                    createMapView.frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight / 2.5)
                    
                    if cityAndCountryVisible {
                        HStack(alignment:.center) {
                            Text(city)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .padding()
                                .multilineTextAlignment(.center)
                                
                            Text(country)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .padding()
                                
                        }.padding([.vertical,.horizontal])
                            .foregroundColor(.black)
                    }
                }
              
                VStack {
                    Text("Select open and close time")
                        .font(.system(size: 20,weight: .bold))
                    datePickerOpen
                    datePickerClose
                  
                }.padding([.horizontal,.vertical])
                
                /*typeGymClubListView
                    .frame(width:UIScreen.screenWidth,height: UIScreen.screenHeight/3)
                    .background(Color.white)*/
                
                testView
                    .frame(width:UIScreen.screenWidth,height: UIScreen.screenHeight/3)
                
                Button("Test") {
                    print(multiTypeGymClubSelection)
                }
                    
                            
                        
                
            }.padding(.vertical)
        }.navigationTitle("Create Gym Club")
           
        
    }
    
    func getCityAnbCountry(latitude:Double,longitude:Double) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.city = city
            self.country = country
        }
    }
}
struct CreateGymClubsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGymClubsView()
    }
}
