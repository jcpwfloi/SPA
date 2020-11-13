//
//  GeneratedView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-30.
//

import SwiftUI

struct GeneratedView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var userModel : UserModel
//    @State var title = "Derived Input View"
    var body: some View {
        
        TabView {
            DerivedInputView()
//            .onTapGesture{
////                self.navigation("Derived Input View")
//                navigationTitle("Derived Input View")
//
//            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Derived Input")
            }
            ExecutiveView()
//            .onTapGesture{
//                self.navigationTitle("Executive View")
//            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Executive")
            }
            ManagementView()
//            .onTapGesture{
//                self.navigationTitle("Management View")
//            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Management")
            }
            PractionerView()
//            .onTapGesture{
//                self.navigationTitle("Practitioner View")
//            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Practitioner")
            }
        }
        .navigationTitle("Generated View")
        .navigationBarItems(trailing: Button("Logout") {
            userModel.logout()
        })
    }
}

