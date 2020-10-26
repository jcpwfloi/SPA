//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct DeleteUserView: View {
    @EnvironmentObject var coreData: CoreData
    @Environment(\.presentationMode) var presentationMode
    @State private var showDeleteAlert = false
    var body: some View{
        if(!self.coreData.projects.isEmpty)
        {
            Text("Select the user name you wish to delete below")
            List(Array(self.coreData.projects.keys), id: \.self){ user in
                Button(action:{
                    showDeleteAlert=true
                }){
                    Text(user)
                }.alert(isPresented: $showDeleteAlert){
                    Alert(title: Text("Warning"), message: Text("Are you sure to delete \(user)?"),primaryButton: .destructive(Text("YES")){
                            coreData.removeUser(username: user)
                        self.presentationMode.wrappedValue.dismiss()
                    },secondaryButton: .cancel())
                }
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Dismiss")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }else{
            Text("User List is Empty.")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Dismiss")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}


struct AddUserView: View {
    @EnvironmentObject var coreData: CoreData
    @State private var newName: String = ""
    @State private var showAddAlert = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
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
                    newName=""
                }
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Add").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.alert(isPresented: $showAddAlert){
                Alert(title: Text("Warning"), message: Text("User name already exist."))
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Dismiss")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct UserListView: View {
    @ObservedObject var user: UserModel
    @EnvironmentObject var coreData: CoreData
    @State private var showingAddSheet = false
    @State private var showingDeleteSheet = false
    var body: some View {

        Button(action: {
            user.logout()
        }){
            Text("Log off")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        NavigationView{
            VStack{
                HStack{
                    Button("Add"){
                        self.showingAddSheet.toggle();
                    }.sheet(isPresented: $showingAddSheet){
                        AddUserView()
                    }
                    Button("Delete"){
                        self.showingDeleteSheet.toggle();
                    }.sheet(isPresented: $showingDeleteSheet){
                        DeleteUserView()
                    }
                }
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
