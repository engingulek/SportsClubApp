//
//  LocationManager.swift
//  SportsClubApp
//
//  Created by engin gülek on 25.01.2023.
//

import Foundation
import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var lastLocation: CLLocation?
   
    
   override init(){
       super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
               lastLocation = location
        
      
    }
    
    
}


