//
//  ContentView.swift
//  SPAbokai
//
//  Created by Bokai Li on 10/7/20.
//
import SwiftUI

class Setup: ObservableObject{
    @Published var uname = ""
    @Published var pname = ""
}

struct User{
    let username: String
}

struct Project{
    let projectname: String
}

struct tempNextScreen: View{
    @EnvironmentObject var setup: Setup
    var body: some View{
        Text("User:\(setup.uname)")
        Text("Project:\(setup.pname)")
    }
}

struct UserView: View {
    @ObservedObject var setup = Setup()
    @State private var userSelected:Bool = false
    //should load users from database
   var userlist = [
        User(username: "user1"),
        User(username: "user2")
    ]
    
    var body: some View {
        NavigationView {
            List(userlist, id: \.username){ user in
                VStack{
                    NavigationLink(destination: ProjectView(), isActive:self.$userSelected){
                        EmptyView()
                    }
                    Button(user.username){
                        setup.uname=user.username
                        self.userSelected = true
                    }
                }
            }.navigationBarTitle(Text("User List"))
        }.environmentObject(setup)
    }
}

struct ProjectView: View {
    @EnvironmentObject var setup: Setup
    @State private var projectSelected:Bool = false
    //handle username and pull project from database
   var projectlist = [
        Project(projectname: "project1"),
        Project(projectname: "project2"),
        Project(projectname: "project3")
    ]
    
    var body: some View {
        VStack{
            ForEach(projectlist, id: \.projectname){project in
                NavigationLink(destination: tempNextScreen(), isActive:self.$projectSelected){
                    EmptyView()
                }
                Button(project.projectname){
                    setup.pname=project.projectname
                    self.projectSelected = true
                }
            }
        }.navigationBarTitle(Text("Project List"))
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
