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
                        print("BarItemButton tapped")
                        self.showEditPage.toggle()
                    }) {
                        //Top right icon
                        Text("BarItemButton")
                    }.sheet(isPresented: $showEditPage) {
                        //Open sheet page
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
