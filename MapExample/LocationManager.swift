//
//  LocationManager.swift
//  MapExample
//
//  Created by Sarah Dadoun on 2025-02-18.
//

import Foundation
import MapKit
import CoreLocation


class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // initialize location manager
    private let locationManager = CLLocationManager()
    @Published  var userLocation: CLLocationCoordinate2D? // permission -> yes
    
    // init
    override init(){
        super.init() // will fetch the previous init code, and add the new ones we write.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading() // observer to mapkit
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let latestLocation = locations.last else {return}
        DispatchQueue.main.async {
            self.userLocation = latestLocation.coordinate
        }
    }
    // user location
}
