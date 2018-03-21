//
//  LocationManager.swift
//  react-native-perms
//
//  Created by Fania on 21.03.2018.
//  Copyright © 2018 Fania. All rights reserved.
//

import Foundation
import CoreLocation

@objc

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locManager: CLLocationManager!
    
    override init() {
        super.init()
        locManager = CLLocationManager()
        locManager.delegate = self
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        <#code#>
    }
}
