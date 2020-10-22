//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var user: UserModel
    @EnvironmentObject var coreData: CoreData
    @State private var newName: String = ""
    @State private var showAddAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                if(!self.coreData.projects.isEmpty)
                {
                    List(Array(self.coreData.projects.keys), id: \.self){ user in
                        NavigationLink(
                            destination: ProjectListView(user: user)){
                            Text(user)
                        }
                    }.navigationBarTitle(Text("User List"))
                }else{
                    Text("User List is Empty, add a user below.")
                    .navigationBarTitle(Text("User List"))
                }
                
                HStack{
                    TextField("Enter New User Name", text: $newName)
                    Button(action:{
                        for n in Array(self.coreData.projects.keys){
                            if(newName==n){
                                showAddAlert=true
                            }
                        }
                        if(!showAddAlert){
                            coreData.addUser(username: newName)
                        }
                    }){
                        Text("Add")
                    }.alert(isPresented: $showAddAlert){
                        Alert(title: Text("Warning"), message: Text("User name already exist."))
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
