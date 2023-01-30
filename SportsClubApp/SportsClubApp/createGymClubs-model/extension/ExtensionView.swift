//
//  Extension.swift
//  SportsClubApp
//
//  Created by engin gülek on 12.01.2023.
//


import SwiftUI
import MapKit

extension  CreateGymClubsView  {
    // MARK: -CreateGymClubsView view part extension
    
    
    /*var createMapView : some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations)
        { location in
            MapAnnotation(coordinate: .init(latitude: location.latitude, longitude: location.longitude)) {
              
            }
        }
    }*/
    
    var createMapView : some View {
        GeometryReader { proxy in
            Map(coordinateRegion: $mapRegion, showsUserLocation: true,
                userTrackingMode: .constant(.follow),annotationItems: locations )
            { location in
                MapAnnotation(coordinate: .init(latitude: location.latitude, longitude: location.longitude)) {
                    ChooseMapPinDesign(imageName: "circle.fill", imageColor: .red)
                }
            }.edgesIgnoringSafeArea(.bottom)
                .gesture(TapGesture()
                    .sequenced(before: DragGesture(
                    minimumDistance: 0,
                    coordinateSpace: .local
                    )).onEnded({ value in
                        switch value {
                        case .second((), let drag):
                            pressLocation = drag?.location ?? .zero
                            selectLocation = pressTapLocation(at: pressLocation, for:proxy.size)
                            if locations.count == 0 {
                                self.locations.append(selectLocation)
                                print(selectLocation.longitude)
                                self.cityAndCountryVisible = true
                                getCityAnbCountry(latitude: selectLocation.latitude, longitude: selectLocation.longitude)
                                
                            }else {
                                self.locations.remove(at: 0)
                                self.cityAndCountryVisible = false
                                
                            }
                        case .first():
                            return
                        }
                    })
                )
        }
     }
    
    // MARK: -DatePicker
    var datePickerOpen : some View {
            DatePicker("Open Time",selection: $openTime,displayedComponents: .hourAndMinute)
    }
    
    var datePickerClose : some View {
        DatePicker("Close Time",selection: $closeTime,displayedComponents: .hourAndMinute)
    }
    
    //MARK: -Type Gym Club List
    var typeGymClubListView : some View {

      
        
        
        VStack {
            
            ForEach(gymClubInfoViewModel.gymClubInfos) { gymClubInfo in
                HStack(spacing:25) {
                    if gymClubInfo.name !=  "All" {
                        selectedGymClubInfos.contains(gymClubInfo.id) ? Image(systemName: "checkmark.circle").foregroundColor(.blue) :
                        Image(systemName: "circle").foregroundColor(.blue)
                        Text(gymClubInfo.name)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }.onTapGesture {
                    let info = GYMSportInfo(_id: gymClubInfo.id, imageName: gymClubInfo.imageName, name: gymClubInfo.name)
                    if selectedGymClubInfos.contains(gymClubInfo.id) {
                        
                        selectedGymClubInfoss.remove(at: selectedGymClubInfoss.firstIndex(of: info)!)
                        selectedGymClubInfos.remove(at: selectedGymClubInfos.firstIndex(of: gymClubInfo.id)!)
                    }else {
                        selectedGymClubInfoss.append(info)
                        selectedGymClubInfos.append(gymClubInfo.id)
                    }
                   
                   
                }
        }

        }
                                    
            .padding(.horizontal)
                .padding(.top)
                .task {
                    await gymClubInfoViewModel.gymClubInfosService()
                }
        }
    

    

   
    private    func pressTapLocation(at point: CGPoint, for mapSize: CGSize) -> ChoseGymMapLocation {
          let lat = mapRegion.center.latitude
          let lon = mapRegion.center.longitude
          
          let mapCenter = CGPoint(x: mapSize.width/2, y: mapSize.height/2)
          
          // X
          let xValue = (point.x - mapCenter.x) / mapCenter.x
          let xSpan = xValue * mapRegion.span.longitudeDelta/2
          
          // Y
          let yValue = (point.y - mapCenter.y) / mapCenter.y
          let ySpan = yValue * mapRegion.span.latitudeDelta/2
          
        return ChoseGymMapLocation(markerType: "selectLocation", latitude: lat - ySpan, longitude: lon + xSpan)
          
      }
}





extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
