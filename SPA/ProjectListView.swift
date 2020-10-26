//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct DeleteProjectView: View {
    var user: String
    @EnvironmentObject var coreData: CoreData
    @Environment(\.presentationMode) var presentationMode
    @State private var showDeleteAlert = false
    var body: some View{
        if(!self.coreData.projects.isEmpty)
        {
            List(self.coreData.projects[user]!, id: \.self){ project in
                Button(action:{
                    showDeleteAlert=true
                }){
                    Text(project)
                }.alert(isPresented: $showDeleteAlert){
                    Alert(title: Text("Warning"), message: Text("Are you sure to delete \(project)?"),primaryButton: .destructive(Text("YES")){
                        coreData.removeProject(username: user, project: project)
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

struct AddProjectView: View {
    var user: String
    @EnvironmentObject var coreData: CoreData
    @State private var newName: String = ""
    @State private var showAddAlert = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        HStack{
            TextField("Enter New Project Name", text: $newName)
            Button(action:{
                for n in self.coreData.projects[user]!{
                    if(newName==n){
                        showAddAlert=true
                    }
                }
                if(!showAddAlert){
                    coreData.addProject(username: user, project: newName)
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

struct ProjectListView: View{
    @EnvironmentObject var coreData: CoreData
    @State private var showingAddSheet = false
    @State private var showingDeleteSheet = false
    var user: String
    
    var body: some View{
        HStack{
            Button("Add"){
                self.showingAddSheet.toggle();
            }.sheet(isPresented: $showingAddSheet){
                AddProjectView(user: user)
            }
            Button("Delete"){
                self.showingDeleteSheet.toggle();
            }.sheet(isPresented: $showingDeleteSheet){
                DeleteProjectView(user: user)
            }
        }
        if(self.coreData.projects[user]?.count ?? 0>0)
        {
            List(self.coreData.projects[user]!, id: \.self){ project in
                NavigationLink(
                    destination: RawInputView()){
                Text(project)
                }
            }.navigationBarTitle(Text("Project List"))
        }else{
            Text("Project List is Empty, add a project below.")
            .navigationBarTitle(Text("Project List"))
        }
    }
}
//#if DEBUG
//struct ProjectListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectListView(user: "U1")
//    }
//}
//#endif
