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
    var createMapView : some View {
        GeometryReader { proxy in
            Map(coordinateRegion: $mapRegion, annotationItems: locations )
            { location in
                
                MapAnnotation(coordinate: .init(latitude: location.latitude, longitude: location.longitude)) {
                        if location.markerType == "userLocation" {
                            ChooseMapPinDesign(imageName: "circle.fill", text: "Your Location", imageColor: .blue)
                        }else {
                            ChooseMapPinDesign(imageName: "checkmark.circle.fill", text: "Select Location", imageColor: .red)
                        }
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
                            if locations.count == 1 {
                                self.locations.append(selectLocation)
                                print(selectLocation.longitude)
                                self.cityAndCountryVisible = true
                                getCityAnbCountry(latitude: selectLocation.latitude, longitude: selectLocation.longitude)
                                
                            }else {
                                self.locations.remove(at: 1)
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
        NavigationView {
                  VStack {
                      Text("\(multiTypeGymClubSelection.count) selections")
                      List(typeGymClubList, selection: $multiTypeGymClubSelection) { type in
                          Text(type.name)
                      }
                      .environment(\.editMode, $editMode)
                      
                  }
                  .navigationTitle("Select gym club types")
                  .navigationBarTitleDisplayMode(.inline)
                 
              }
    }
    
    // MARK: - Pay Period
   
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
