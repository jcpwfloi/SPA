//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct ProjectListView: View{
    @EnvironmentObject var coreData: CoreData
    @State private var newName: String = ""
    @State private var showAddAlert = false
    
    var user: String
    var body: some View{
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
        HStack{
            TextField("Enter New Project Name", text: $newName)
            Button(action:{
                if(self.coreData.projects[user]!.isEmpty)
                {
                    for n in self.coreData.projects[user]!{
                        if(newName==n){
                            showAddAlert=true
                        }
                    }
                }
                if(!showAddAlert){
                    coreData.addProject(username: user, project: newName)
                }
            }){
                Text("Add")
            }.alert(isPresented: $showAddAlert){
                Alert(title: Text("Warning"), message: Text("User name already exist."))
            }
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
