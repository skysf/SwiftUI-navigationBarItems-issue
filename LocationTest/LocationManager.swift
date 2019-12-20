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

    //Create instance for NetworkManger.swift
    //@ObservedObject var networkManager = NetworkManager.shared
    //@EnvironmentObject var networkManager: NetworkManager
    //When this class is being called, below will run first
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
     
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        //self.setUp()
        //self.locationManager.requestAlwaysAuthorization()
        
        /*
         .requestLocation() will only call the didUpdateLocations locations: once ,
         whereas .startUpdatingLocation() will keep on calling didUpdateLocations locations: every few seconds
         or whenever there's location change until you stop it by calling locationManager.stopUpdatingLocation.
        
         **/
        
        //self.locationManager.requestLocation()
        //setUp()
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
    
    @Published var setting_locationAlert : Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

//    var statusString: String {
//        guard let status = locationStatus else {
//            return "unknown"
//        }
//
//        switch status {
//        case .notDetermined: do {
//            print("user refused to give permission")
//            return "notDetermined"
//
//        }
//
//        case .authorizedWhenInUse: return "authorizedWhenInUse"
//        case .authorizedAlways: return "authorizedAlways"
//        case .restricted: return "restricted"
//        case .denied: return "denied"
//        default: return "unknown"
//        }
//
//    }

    
    
    func setUp() {
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    //Check user location setting
    func checkLocation(status: CLAuthorizationStatus) {
        //let status = CLLocationManager.authorizationStatus()
       
        
        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()) {
            
            //Show alert to let user open app location setting page
            setting_locationAlert = true
           
            
            
            // show alert to user telling them they need to allow location data to use some feature of your app
            print("User need to give location permission, and alert is: ", setting_locationAlert)
            
            
            return
        }
        
        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            //locationManager.requestWhenInUseAuthorization()
            
            // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
            // locationManager.requestAlwaysAuthorization()
            return
        }
        
        // at this point the authorization status is authorized
        // request location data once
        //          locationManager.requestLocation()
        
        // start monitoring location data and get notified whenever there is change in location data / every few seconds, until stopUpdatingLocation() is called
        // locationManager.startUpdatingLocation()
    }
    
    
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
//        print("In LocationManger.swift @func:", #function, "The value is: ", statusString)
        print("In LocationManger.swift @Func locationManager, Status is updaing")
        
        //checkLocation(status: status)
        
        //Print out
//        switch status {
//        case .authorizedAlways:
//            print("user allow app to get location data when app is active or in background")
//        case .authorizedWhenInUse:
//            print("user allow app to get location data only when app is active")
//        case .denied:
//            print("user tap 'disallow' on the permission dialog, cant get location data")
//        case .restricted:
//            print("parental control setting disallow location data")
//        case .notDetermined:
//            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
//        @unknown default:
//            print("unknown")
//        }
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
        print("Location is updating")
        //Print out location every second
        //print("This is the new location: ",#function, location)
        
        
        //TODO: Fetch data every second while app is open
//        let lat = "&latitude=37.773972"
//        let lon = "&longitude=-122.431297"
//        let maxradius = "&maxradiuskm=200"
//        let endtime = ""
//        let time = ""
//        networkManager.fetchData(startTime: time, endTime: endtime, latitude: lat, longtitude: lon, maxRadius: maxradius)
    }

}
