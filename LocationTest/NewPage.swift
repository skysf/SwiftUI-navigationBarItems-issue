//
//  NewPage.swift
//  LocationTest
//
//  Created by 陆天宇 on 12/18/19.
//  Copyright © 2019 陆天宇. All rights reserved.
//

import SwiftUI

struct NewPage: View {
    
    @ObservedObject var locationManager = LocationManager()
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    var body: some View {
       
        Button(action: {
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            
        }) {
            HStack {
                Image(systemName: "mappin.circle")
                Text("Location Setting")
            }
        }
          
        
    }
}

struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewPage()
    }
}
