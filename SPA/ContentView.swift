//
//  ContentView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user: UserModel
    @ObservedObject var viewState: ViewState
    
    @ViewBuilder
    var body: some View {
        VStack {
            if (!user.isLoggedin) {
                LoginView(user: user)
            } else {
                if (viewState.state == 0) {
                    UserListView(user: user, viewState: viewState)
                } else {
                    if(viewState.state == 1){
                        DerivedInputView(viewState: viewState)
                    }
                    else{
                        RawInputView(viewState:viewState)
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(user: UserModel())
//    }
//}
