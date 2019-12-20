//
//  ContentView.swift
//  LocationTest
//
//  Created by 陆天宇 on 12/16/19.
//  Copyright © 2019 陆天宇. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var show = false
    @State var showEditPage = false
    //Alert
    var alertContent: Alert {
        //Method 1
        //        Alert(
        //            title: Text("Give Location"),
        //            message: Text("We need location to show"),
        //            primaryButton:
        //                .default(Text("open"),
        //                 action: {
        //                    UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        //                 }) ,
        //            secondaryButton: .cancel()
        //        )
        Alert(title: Text("We need your location to show earthquake around you"), primaryButton: .default(Text("Setting"), action: {
            //Display system location setting page
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        }), secondaryButton: .default(Text("Cancel"), action: {
            //self.networkManager.setting_showAroundMe = false
        }))
        
    }
    
    var body: some View {
        
        
        NavigationView {
            List {
                Text("Text")
                Button("Location button") {
                    print("Location button tapped")
                    self.show.toggle()
                }.sheet(isPresented: $show) {
                    NewPage()
                }
            }
            .navigationBarItems(
                
                trailing:
                VStack {
                    
                    Button(action: {
                        print("Edit button tapped")
                        self.showEditPage.toggle()
                    }) {
                        //Top right icon
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("BarItemButton")
                    }.sheet(isPresented: $showEditPage) {
                        //Open sheet page EditPage.swift
                        //EditPage(showPage: self.$showEditPage).environmentObject(self.networkManager)
                        NewPage()
                    }
                    
                }//End of trailing VStack
            )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
