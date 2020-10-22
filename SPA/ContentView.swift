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
    @EnvironmentObject var coreData: CoreData
    
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
                    else if(viewState.state == 2){
                        ExecutiveView()
                    }
                    else if(viewState.state == 3){
                        ManagementView()
                    }
                    else if(viewState.state == 4){
                        PractionerView()
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
