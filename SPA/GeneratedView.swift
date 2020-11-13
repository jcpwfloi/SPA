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
    @State var title = "Derived Input View"
    var body: some View {
        
        TabView {
            DerivedInputView()
            .onAppear(){
                title = "Derived Input View"
                print(title)
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Derived Input")
            }
                
            
            ExecutiveView()
            .onAppear(){
                title = "Executive View"
                print(title)
            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Executive")
            }
            
            ManagementView()
            .onAppear(){
                title = "Management View"
                print(title)
            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Management")
            }
            
            PractionerView()
            .onAppear(){
                title = "Practitioner View"
                print(title)
            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Practitioner")
            }
        }
        .navigationTitle("Generated View")
        .navigationBarItems(trailing: Button("Logoff") {
            userModel.logout()
        })
//        .id(UUID())
    }
}

