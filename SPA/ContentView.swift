//
//  ContentView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

//The top level view of the app

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext //Global context of the core data module
    
    @EnvironmentObject var user: UserModel //Global user model used to maintain global app logic
    
    //return the user list view
    private func ContainedView() -> AnyView {
        AnyView(UserListView()
                            .environment(\.managedObjectContext, viewContext))
        
    }
    
    //If the user is loggin, show the userlist view; otherwise show the login view
    @ViewBuilder
    var body: some View {
        VStack {
            if (!user.isLoggedin) {
                LoginView(user: user).environment(\.managedObjectContext, viewContext)
            } else {
                ContainedView()
            }
        }
    }
}
