//
//  CreateGymClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI
import MapKit
import Combine
enum Pay: String, CaseIterable, Identifiable {
    case year, month  ,day

    var id: Self { self }
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
    @State var gymClubDescription : String = ""
    @State var textFieldGymClubNameLimit = 20
     @State var textFieldGymDescriptionLimit = 275
     @State var textFieldGymClubNameLimitDecrase = 0
     @State var textFieldDescriptionDecrase = 0
     @State var gymNameStatusCount = 0
     @State var gymDescriptionStatusCount = 0
    @State var pay : String = ""
    @State var selectedPayPerion : Pay = .year
    var payPeriod = ["Day,Month,Year"]
    
    
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
                 
                VStack {
                    TextField("Gym Name", text: $gymName)
                        .asTextField(textContentType: .name)
                        .onChange(of: gymName) { newValue in
                            limitGymNameTextField(textFieldGymClubNameLimit, newValue)
                        }
                    HStack {
                        textFieldGymClubNameLimitDecrase < textFieldGymClubNameLimit ? nil : Text("Character Limit")
                            .foregroundColor(.red)
                        Spacer()
                        Text("\(textFieldGymClubNameLimitDecrase)/\(textFieldGymClubNameLimit)")
                             .foregroundColor(
                                 textFieldGymClubNameLimitDecrase < textFieldGymClubNameLimit ? .black : .red
                             )
                    }.padding(.horizontal)
                  
                }
            
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
                
                typeGymClubListView
                    .frame(width:UIScreen.screenWidth,height: UIScreen.screenHeight/3)
                
                VStack {
                    Text("Give information about the gym club")
                        .padding(.top)
                        .font(.system(size: 20,weight: .bold))
                    TextField("Gym Description", text: $gymClubDescription ,axis: .vertical)
                        .padding()
                        .lineLimit(6, reservesSpace: true)
                        .textFieldStyle(.plain)
                        .border(.black)
                        .padding()
                        .onChange(of: gymClubDescription) { newValue in
                           limitGymDescriptionTextField(limit: textFieldGymDescriptionLimit, value: newValue)
                           
                        }
                    
                    HStack {
                        textFieldDescriptionDecrase < textFieldGymDescriptionLimit ? nil : Text("Character Limit")
                            .foregroundColor(.red)
                        Spacer()
                        Text("\(textFieldDescriptionDecrase)/275")
                            .foregroundColor(
                                textFieldDescriptionDecrase < textFieldGymDescriptionLimit ? .black
                                : .red
                            )
                    }.padding(.horizontal)
                  
                }
                VStack {
                    Text("Enter the price and period type")
                    .padding(.top)
                    .font(.system(size: 20,weight: .bold))
                    HStack{
                        TextField("Pay", text: $pay)
                            .padding([.vertical,.horizontal],10)
                            .keyboardType(.numberPad)
                            .border(Color.black.opacity(0.2))
                        
                            Picker("Pay Period", selection: $selectedPayPerion) {
                                Text("Year").tag(Pay.year)
                                Text("Month").tag(Pay.month)
                                Text("Day").tag(Pay.day)
                            }
                    }
                }.padding(.horizontal)
                
            
                Button("Save") {
                    
                }
                .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                .padding(.vertical)
              
                
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
    
    func limitGymNameTextField(_ limit : Int, _ value : String) {
       /* textFieldGymClubNameLimitDecrase = textFieldGymClubNameLimitDecrase + 1
        print(textFieldGymClubNameLimitDecrase)*/
        print("On Change \(value)")
        
        if gymNameStatusCount < value.count{
            gymNameStatusCount = value.count
            textFieldGymClubNameLimitDecrase += 1
        }else if value.count == 20 {
            gymNameStatusCount = value.count
        }
        else{
            gymNameStatusCount = value.count
            textFieldGymClubNameLimitDecrase -= 1
        }
        if value.count > limit {
            gymName = String(value.prefix(limit))
            textFieldGymClubNameLimitDecrase = 20
        }
    }
    
    func limitGymDescriptionTextField(limit: Int, value :String){
        if gymDescriptionStatusCount < value.count {
            gymDescriptionStatusCount = value.count
            textFieldDescriptionDecrase += 1
        }else if value.count == 275 {
            gymDescriptionStatusCount = value.count
        }else {
            gymDescriptionStatusCount = value.count
            textFieldDescriptionDecrase -= 1
        }
        if value.count > limit {
            gymClubDescription = String(value.prefix(limit))
            textFieldDescriptionDecrase = 275
        }
    }
    
  
}
struct CreateGymClubsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGymClubsView()
    }
}
