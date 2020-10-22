//
//  ContentView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user: UserModel
    @EnvironmentObject var viewState: ViewState
    
    @ViewBuilder
    var body: some View {
        VStack {
            if (!user.isLoggedin) {
                LoginView(user: user)
            } else {
                if (viewState.state == 0) {
                    UserListView(user: user)
                } else {
                    if(viewState.state == 1){
                        DerivedInputView()
                    }
                    if(viewState.state == 2){
                        ExecutiveView()
                    }
                    if(viewState.state == 3){
                        ManagementView()
                    }
                    else{
                        RawInputView()
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
