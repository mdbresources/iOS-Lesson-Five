//
//  LocationManager.swift
//  lesson5demo
//
//  Created by Anmol Parande on 3/6/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManager {
    func beginListening()
    func stopListening()
    
    var delegate: LocationManagerDelegate? {get set}
}

protocol LocationManagerDelegate {
    func updatedLocation(city:String?, state: String?)
}

class CoreLocationManager: NSObject, LocationManager, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager
    var delegate: LocationManagerDelegate?
        
    override init() {
        self.locationManager = CLLocationManager()
        
        super.init()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
    }
    
    func beginListening() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopListening() {
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let geocoder = CLGeocoder()
        guard let location = locations.last else { return }
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemark = placemarks?.last else { return }
            
            let city = placemark.locality
            let state = placemark.administrativeArea
            
            self.delegate?.updatedLocation(city: city, state: state)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
}
