//
//  ChooseClubLocation.swift
//  SportsClubApp
//
//  Created by engin gülek on 10.01.2023.
//

import SwiftUI
import MapKit
struct ChooseClubLocation: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            VStack {
                Image(systemName: "arrow.down")
                    .font(.system(size: 25))
                
                Divider()
                    .frame(maxWidth: UIScreen.screenWidth / 4, minHeight: 2)
                    .background(.black)
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    .padding([.bottom,.top],2)
                    .font(.system(size: 20,weight: .bold))

            }.onTapGesture {
                dismiss()
            }
            MapView()
            
         
        }
    }
}

struct MapView:View {
    @State var mapRegion: MKCoordinateRegion
    @State var testBool = true
    @State var pressLocation = CGPoint.zero
    @State var selectLocation = ChoseGymMapLocation(markerType: "selectLocation", latitude: 40.722849, longitude: -73.893456)
    
    init() {
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: .init(latitude: 40.722849, longitude: -73.893456), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
  @State var locations = [
        ChoseGymMapLocation(markerType: "userLocation", latitude: 40.722849, longitude: -73.893456),
       // ChoseGymMapLocation(markerType: "selectLoction",latitude: 40.721809, longitude: -73.905965),
    ]
    var body : some View {
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
                            }else {
                                self.locations.remove(at: 1)
                            }
                        case .first():
                            return
                        }
                    })
                
                )
        }
    }
}


extension MapView {
    
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

struct ChooseClubLocation_Previews: PreviewProvider {
    static var previews: some View {
        ChooseClubLocation()
    }
}
