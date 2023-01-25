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
    @Published var city : String = ""
    @Published var state : String = ""
   
    static let a = LocationManager()
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
        
        location.placemark { placemark, error in
            guard let placemark = placemark else {
                print("Locaiton placeMart(get city and country) Erroo")
                return
            }
            self.state = placemark.state!
            self.city = placemark.city!
        }
        
    }
}


extension CLPlacemark {
    /// street name,
    var city: String? { locality }
    /// neighborhood, common name, eg. Mission District
 
    var state: String? { administrativeArea }
    /// county, eg. Santa Clara
    var county: String? { subAdministrativeArea }
 
  
}

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}


