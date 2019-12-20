//
//  LocationManager.swift
//  EarthQuake
//
//  Created by 陆天宇 on 11/12/19.
//  Copyright © 2019 陆天宇. All rights reserved.
//

import SwiftUI
import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
     
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()

        print("In LocationManger.swift @initi, this is called")
    }

    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var lastLocation: CLLocation? {
        willSet { objectWillChange.send() }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status

        print("In LocationManger.swift @Func locationManager, Status is updaing")
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
        print("Location is updating")

    }

}
