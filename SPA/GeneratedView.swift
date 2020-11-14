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
    var body: some View {
        
        TabView {
            DerivedInputView()
            .tabItem {
                Image(systemName: "list.dash")
                Text("Derived Input")
            }
            ExecutiveView()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Executive")
            }
            ManagementView()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Management")
            }
            PractionerView()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Practitioner")
            }
        }.navigationBarItems(trailing: Button("Logout") {
            userModel.logout()
        })
    }
}

