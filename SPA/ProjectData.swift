//
//  ProjectData.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//
import SwiftUI
class CoreData : ObservableObject {
    
    @Published var projects:[String:[String]] = [String:[String]]()//["U1": ["P1","P2"],
                   //"U2": ["P1","P2","P3"]]
    
    func addUser(username:String){
        projects[username]=[]
    }
    func removeUser(username:String){
        projects.removeValue(forKey: username)
    }
    
    func addProject(username:String,project:String){
        projects[username]!.append(project)
    }
    func removeProject(username:String,project:String){
        if let index = projects[username]!.firstIndex(of: project) {
            projects[username]!.remove(at: index)
        }
    }
    
}

