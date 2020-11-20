//
//  SPAApp.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

//The entrance of the app

@main
struct SPAApp: App {
    let persistenceController = PersistenceController.shared //The persistence controller
    
    var body: some Scene {
        WindowGroup {
            //passing two globaal states: shared model (wrapper around the SPAModel) and the user model
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(SharedModel())
                .environmentObject(UserModel())
        }
    }
}

