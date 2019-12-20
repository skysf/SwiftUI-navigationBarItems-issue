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

    var body: some View {
       
        Text("New Page")
          
        
    }
}

struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewPage()
    }
}
