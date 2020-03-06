//
//  DataManager.swift
//  lesson5demo
//
//  Created by Anmol Parande on 3/6/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

class DataManager: LocationManagerDelegate {
    var locationManager: LocationManager
    
    var city: String = ""
    var state: String = ""
    
    init() {
        self.locationManager = CoreLocationManager()
        self.locationManager.delegate = self
    }
    
    init(with manager: LocationManager) {
        self.locationManager = manager
        locationManager.delegate = self
    }
    
    func updatedLocation(city: String?, state: String?) {
        if let city = city {
            self.city = city
        }
        
        if let state = state {
            self.state = state
        }
    }
}
