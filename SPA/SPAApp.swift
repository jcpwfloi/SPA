//
//  SPAApp.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

@main
struct SPAApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(user: UserModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ViewState())
        }
    }
}
