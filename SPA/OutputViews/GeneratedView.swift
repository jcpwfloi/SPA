//
//  GeneratedView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-30.
//

import SwiftUI

//this is the output view that combines the four different screens

struct GeneratedView: View {
    @Environment(\.managedObjectContext) private var viewContext  //Global context of the core data module
    
    @EnvironmentObject var userModel: UserModel  //Global user model used to maintain global app logic
    
    @State private var selectedTab = 0  //the current view
    
    //the navigation bar title
    private var title: String {
        switch (self.selectedTab) {
        case 0:
            return "Derived Input View"
        case 1:
            return "Executive View"
        case 2:
            return "Management View"
        case 3:
            return "Practitioner View"
        default:
            return ""
        }
    }
    
    var body: some View {
        //generate a table to switch between the four views
        TabView(selection: $selectedTab) {
            DerivedInputView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Derived Input")
                }.tag(0)
            
            ExecutiveView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Executive")
                }.tag(1)
            
            ManagementView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Management")
                }.tag(2)
            
            PractionerView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Practitioner")
                }.tag(3)
            
        }
        .navigationTitle(title)
        .navigationBarItems(trailing: Button("Log off") {
            userModel.logout()
        })
    }
}

