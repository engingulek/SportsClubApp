//
//  UpdateView.swift
//  SportsClubApp
//
//  Created by engin gülek on 15.01.2023.
//

import SwiftUI
import MapKit

struct UpdateViewGymClub: View {
    @State var updateState = false
    @State var changeGymName : String = ""
    
    @State var pressLocation = CGPoint.zero
    @State var selectLocation = ChoseGymMapLocation(markerType: "selectLocation", latitude: 40.722849, longitude: -73.893456)
    @State var selectOpenTime = Date()
    @State var selectCloseTime = Date()
    @State var getOpenTime:String = ""
    @State var getCloseTime:String = ""
    @State var getTypeGymClubList:[GYMSportInfo] = []
    @State var addTypeGymClubList:[GYMSportInfo] = []
    @State var gymClubDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five"
    
    @State var pay : String = "$135"
    @State var selectedPayPerion : String = "Year"
    
    @State var textFieldGymClubNameLimit = 20
     @State var textFieldGymDescriptionLimit = 275
     @State var textFieldGymClubNameLimitDecrase = 0
     @State var textFieldDescriptionDecrase = 275
     @State var gymNameStatusCount = 0
     @State var gymDescriptionStatusCount = 275
    @ObservedObject var profilViewModel = ProfilViewModel()
  
    var body: some View {
        ScrollView {
            profilViewModel.userGymClub.count != 0  ? VStack(alignment : .center){
                VStack {
                    ZStack(alignment:.bottom) {
                        gymClubImage
                    }
                    gymNameText
                    // create struct view for map view. this struct will to use for create amd udpate
                    cityAndCountryText
                    gymClubInfosView
                    openAndCloseTime
                    payAndPeriodView
                    gymClubDescriptionTextField
                }
            } : nil
            
            profilViewModel.userGymClub.count == 0 ? Text("There are no advertisements. Create an ad") : nil
        }
        .task {
            setDateTest()
            await profilViewModel.userGymClub()
        }
        .navigationTitle("View Gym Club Advert")
    }
    
    // this funciton will to use until the api is created
    func setDateTest () {
        self.getOpenTime = "10:30 AM"
        self.getCloseTime = "9:30 PM"
        changeHoursAndMinuteToDateFormater(openTime: getOpenTime, closeTime: getCloseTime)
        
       
    }
    
    
    func changeHoursAndMinuteToDateFormater(openTime:String,closeTime:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        /*let formatterOpenTime = dateFormatter.string(from: dateFormatter.date(from: openTime)!)
        let formatterCloseTime = dateFormatter.string(from: dateFormatter.date(from: closeTime)!)*/
        selectOpenTime = dateFormatter.date(from: getOpenTime) ?? Date()
        selectCloseTime = dateFormatter.date(from: getCloseTime) ?? Date()
       
        
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        
        UpdateViewGymClub()
    }
}
