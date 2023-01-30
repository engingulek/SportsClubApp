//
//  CreateGymClubsView.swift
//  SportsClubApp
//
//  Created by engin gülek on 4.01.2023.
//

import SwiftUI
import MapKit
import Combine
import Alamofire
import PhotosUI
import FirebaseStorage
enum Pay: String, CaseIterable, Identifiable {
    case year = "Year", month = "Month"  ,day = "Day"

    var id: Self { self }
}
struct CreateGymClubsView: View {
    @ObservedObject var gymClubInfoViewModel = GymClubInfoViewModel()
    @State private var gymName:String = ""
    @State private var city:String = ""
    @State private var country:String = ""
    @State var cityAndCountryVisible = false
    @State private var mapView : Bool = false
    
    @State var pressLocation = CGPoint.zero
    @State var selectLocation = ChoseGymMapLocation(markerType: "selectLocation", latitude: 0.0, longitude: 0.0)
    @State var openTime = Date()
    @State var closeTime = Date()
    @State var selectedTypeGymClub: String?
    
    @State var editMode: EditMode = .active
    
    @State var gymClubDescription : String = ""
    @State var textFieldGymClubNameLimit = 20
     @State var textFieldGymDescriptionLimit = 275
     @State var textFieldGymClubNameLimitDecrase = 0
     @State var textFieldDescriptionDecrase = 0
     @State var gymNameStatusCount = 0
     @State var gymDescriptionStatusCount = 0
    @State var pay : String = ""
    @State var selectedPayPerion : String = "Year"
    var payPeriod = ["Day,Month,Year"]
    
    @ObservedObject var createGymViewModel = GymCreateViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @State var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    @StateObject var locationManager = LocationManager()
    
    
    @State var locations = [ChoseGymMapLocation]()
    @State var selectedLatitude = 0.0
    @State var selectedLongitude = 0.0
    @State var selectedGymClubInfos = [String]()
    @State var selectedGymClubInfoss = [GYMSportInfo]()

 
  
  
 
    var body: some View {
        
        ScrollView {
            VStack {
                
                VStack{
                    

                    PhotosPicker(
                           selection: $selectedItem,
                           matching: .images,
                           photoLibrary: .shared()) {
                               Text("Select a photo")
                                  
                           }
                           .onChange(of: selectedItem) { newItem in
                                           Task {
                                               if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                                   selectedImageData = data
                                               }
                                           }
                                       }
                    
                
                    
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .padding()
                            .frame(width: UIScreen.screenWidth / 2)
                            .padding()
                    }
                }
                 
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
                
                VStack {
                    Text("Select gym club type")
                        .font(.system(size: 20,weight: .bold))
                    typeGymClubListView
                        .frame(width:UIScreen.screenWidth,height: UIScreen.screenHeight/6)
                }.padding([.horizontal,.vertical])
              
                
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
                                Text("Year").tag(Pay.year.rawValue)
                                Text("Month").tag(Pay.month.rawValue)
                                Text("Day").tag(Pay.day.rawValue)
                            }
                    }
                }.padding(.horizontal)
                
                
                Button("Save") {

                    addDataDatabase()
                   
                }
                .buttonStyle(StartPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
                .padding(.vertical)
              
                
            }.padding(.vertical)
        }.navigationTitle("Create Gym Club")
           
        
    }
    
    
    func addDataDatabase(){
        
        var imageurl = ""
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            
             let randomID = UUID.init().uuidString
             let uploadRef = Storage.storage().reference(withPath: "gynClubsApp/\(randomID).jpg")
          guard let imageData =  uiImage.jpegData(compressionQuality: 0.75) else {return }
            
            let uploadMetadata  = StorageMetadata.init()
            uploadMetadata.contentType = "image/jpeg"
            
            uploadRef.putData(imageData,metadata: uploadMetadata){ dowloadMetaData,error in
                if let error = error {
                    print("Error image url \(error.localizedDescription)")
                }else{
                    uploadRef.downloadURL { url, error in
                        imageurl = url!.absoluteString
                        let userId = UserDefaults.standard.string(forKey: "uid")
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "HH:mm"
                        let openTimeString = dateFormatter.string(from: openTime)
                        let closeTimeString = dateFormatter.string(from: closeTime)
                        
                        
                        print("New Gym Club \(openTimeString)  \(closeTimeString)")
                        
                        
                        let newGymClub = GymClub(_id: "", createUserId: userId, imageUrl: imageurl, name: gymName, rating: 0, location: Location(latitude: selectedLatitude, longitude: selectedLongitude, city: city, state: country), gymSportInfo:selectedGymClubInfoss , destination: gymClubDescription, startClock: openTimeString, finishClock: closeTimeString, payPeriod: ClubPayPeriod(pay: Double(pay), period: selectedPayPerion), comment: [Comment](), registeredUsers: [User]())
                        
                        Task {
                            if  newGymClub == newGymClub{
                                await createGymViewModel.gymCreateService(newGymClub : newGymClub)
                            }
                           
                        }
                    }
                }
            }
            
        }
        
    }
    
    func getCityAnbCountry(latitude:Double,longitude:Double) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.city = city
            self.country = country
            self.selectedLongitude = longitude
            self.selectedLatitude = latitude
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
