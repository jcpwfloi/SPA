//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack{
            Button(action: {
                user.logout()
            }){
                Text("Log off")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
            }
            NavigationView{
                List(Array(projects.keys), id: \.self){ user in
                    NavigationLink(
                        destination: ProjectListView(user: user)){
                    Text(user)
                    }
                }.navigationBarTitle(Text("User List"))
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

//#if DEBUG
//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView(user: UserModel())
//    }
//}
//#endif