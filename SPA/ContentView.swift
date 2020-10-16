//
//  ContentView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user: UserModel = UserModel()
    
    @ViewBuilder
    var body: some View {
        VStack {
            if (!user.isLoggedin) {
                LoginView(user: user)
            } else {
                UserListView(user: user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: UserModel())
    }
}
