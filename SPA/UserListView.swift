//
//  ContentView.swift
//  SPAbokai
//
//  Created by Bokai Li on 10/7/20.
//
import SwiftUI

struct User{
    let username: String
}

struct Project{
    let projectname: String
}

struct UserView: View {
   var userlist = [
        User(username: "user1"),
        User(username: "user2")
    ]
    
    var body: some View {
        NavigationView {
            List(userlist, id: \.username){ user in
                Text(user.username)
            }.navigationBarTitle(Text("User List"))
        }
    }
}

struct ProjectView: View {
   var projectlist = [
        Project(projectname: "project1"),
        Project(projectname: "project2")
    ]
    
    var body: some View {
        NavigationView {
            List(projectlist, id: \.projectname){ project in
                Text(project.projectname)
            }.navigationBarTitle(Text("Project List"))
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
