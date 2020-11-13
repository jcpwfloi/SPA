//
//  ContentView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var user: UserModel
    @EnvironmentObject var viewState: ViewState
    
    private func ContainedView() -> AnyView {
        switch (viewState.state) {
        case 0:
            return AnyView(UserListView()
                .environment(\.managedObjectContext, viewContext))
//        case 1:
//            return AnyView(DerivedInputView())
//        case 2:
//            return AnyView(ExecutiveView())
//        case 3:
//            return AnyView(ManagementView())
//        case 4:
//            return AnyView(PractionerView())
        default:
            return AnyView(EmptyView())
        }
    }
    
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(user: UserModel())
//    }
//}
