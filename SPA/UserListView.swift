//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var user: UserModel
    @ObservedObject var cd: CoreData = CoreData()
    @State private var newName: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                List(Array(self.cd.projects.keys), id: \.self){ user in
                    NavigationLink(
                        destination: ProjectListView(user: user)){
                        Text(user)
                    }
                }.navigationBarTitle(Text("User List"))
                
                HStack{
                    TextField("Enter New User Name", text: $newName)
                    Button(action:{
                        cd.addUser(username: newName)
                    }){
                        Text("Add")
                    }
                }
                
                Button(action: {
                    user.logout()
                }){
                    Text("Log off")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#if DEBUG
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(user: UserModel())
    }
}
#endif
