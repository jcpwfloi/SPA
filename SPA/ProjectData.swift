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
    
    func addProject(username:String,project:String){
        if(projects[username]==nil){
            projects[username]=[project]
        }else{
            projects[username]!.append(project)
        }
    }
}

