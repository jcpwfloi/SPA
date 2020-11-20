//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

//This is the project list screen. It allows
//the user to see the project list of a specific user.
//It also allows for the creation and deletion of projects.

struct ProjectListView: View{
    @Environment(\.managedObjectContext) private var viewContext  //Global context of the core data module
    
    @State private var newName: String = ""  //The String textfield input for the name of the new project
    @State private var showAddAlert = false  //Controls the visibility of the add alert
    @State private var showingAddSheet = false  //Controls the visibility of the popup add project sheet
    
    @ObservedObject var user: User  //The user that owns the project list
    @EnvironmentObject var userModel: UserModel //Global user model used to maintain global app logic
    
    @State private var deleteIndexSet: IndexSet?
    @State private var showingDeleteAlert = false //Controls the visibility of the delete alert
    @State private var errMsg = "Empty Project Name" //Error message shown on the new project input alert
    @State private var error = false  //Controls the visibility of invalid new project input alert
    
    //The projects of the user
    public var projects: [Project] {
        let set = user.projects as? Set<Project> ?? []
        return set.sorted {
            $0.name ?? "" < $1.name ?? ""
        }
    }
    
    var body: some View {
        //The add button in the add project popup
        let popUpAddButton =
            Button("Add") {
                if let validatedName = checkValid(name: newName) {
                    addProject(name: validatedName, user: user)
                    self.showingAddSheet.toggle()
                }
                else{
                    error = true
                }
            }
        //The dismiss button in the popup
        let popUpDismissButton =
            Button(action: {
                self.showingAddSheet.toggle()
            }){
                Text("Dismiss")
            }.foregroundColor(.red)
            .accessibilityIdentifier("ProjectDismiss")
        
        //The add project popup
        let addProjectPopup =
            NavigationView {
                Form {
                    Section {
                        TextField("Enter New Project Name", text: $newName).accessibilityIdentifier("new project field")
                    }
                    popUpAddButton
                    popUpDismissButton
                }.navigationTitle("Add a New Project")
            }
            .alert(isPresented: $error) {
                Alert(title: Text("Error"), message: Text(errMsg))
            }
        
        //The add button on the main screen
        let addButton =
            Button(action: {
                self.showingAddSheet.toggle()
            }) {
                Image(systemName: "person.badge.plus.fill")
                    .font(Font.system(.title).bold())
            }.sheet(isPresented: $showingAddSheet){
                addProjectPopup
            }
            .accessibilityIdentifier("Add Project")
        
        //The logoff button
        let logoutButton =
            Button(action: {
                userModel.logout()
            }) {
                Text("Log off")
            }
        
        //Buttons on the navigation bar
        let navigationButtons =
            HStack {
                addButton
                Spacer()
                Spacer()
                Spacer()
                logoutButton
            }
        
        //The view that display the list of projects
        let projectList =
            List {
                ForEach(projects, id: \.self) { project in
                    NavigationLink(destination: RawInputView( model: SPAModel(project: project))
                                    .environment(\.managedObjectContext, viewContext)) {
                        Text("\(project.name ?? "Not Set")")
                    }
                }.onDelete(perform: deleteProject)
            }
            .accessibilityIdentifier("ProjectList")
        
        //The alert to warn the user of deleting a project
        let deleteAlert =
            Alert(title: Text("Warning"), message: Text("Do you surely want to delete the item?"), primaryButton: .destructive(Text("Delete")) {
                if let iset = deleteIndexSet {
                    removeProject(at: iset)
                }
            } , secondaryButton: .cancel())
        
        //Conditionally show different contents
        if projects != [] {
            projectList
                .alert(isPresented: $showingDeleteAlert, content: {
                    deleteAlert
                })
                .navigationBarTitle(Text("Project List - \(user.username ?? "Null")"))
                .navigationBarItems(trailing: navigationButtons)
        } else {
            //Empty list
            Text("Empty")
                .navigationBarTitle(Text("Project List - \(user.username ?? "Null")"))
                .navigationBarItems(trailing: navigationButtons)
        }
    }
    
    //Delete a project, will pop up a delete alert first for the user to confirm
    private func deleteProject(at offsets: IndexSet) {
        self.deleteIndexSet = offsets
        self.showingDeleteAlert = true
    }
    
    //Check if the new project name is valid.
    private func checkValid(name : String) -> String?{
        //check if empty
        if(name.isEmpty){
            errMsg = "Empty Project Name"
            return nil
        }
        
        //Delegate to the validation module
        let result = validateInputParameter(name,tag:projectNameValidationTag)
        if(result == nil){
            errMsg = "Invalid Project name"
            return nil
        }
        
        //Check for repeated names
        for project in projects{
            if(project.name == result!.1!){
                errMsg = "Project name already existed"
                return nil
            }
        }
        //return the validated name
        return result!.1!
    }
    
    //Add a new project and flush
    private func addProject(name: String, user: User) {
        withAnimation {
            //Set up a new project in the current context
            let newProject = Project(context: viewContext)
            newProject.name = name
            let newProjectDetails = ProjectDetails(context: viewContext)
            newProjectDetails.projectName = name
            newProjectDetails.projectProgrammingLanguage = "Language"
            newProjectDetails.projectAvgAnnualSalary = 100000.0
            newProjectDetails.projectTeamSize = 1.0
            newProjectDetails.projectNcSloc = 100000.0
            newProjectDetails.projectReqDesEffort = 2000.0
            newProjectDetails.projectDevEffort = 10000.0
            newProjectDetails.projectFindDefectEffort = 1000.0
            newProjectDetails.projectReworkEffort = 100.0
            newProjectDetails.projectIssueCount = 100.0
            newProjectDetails.projectPostReleaseIndicator = "N"
            newProject.details = newProjectDetails
            //add the new project to the user
            user.addToProjects(newProject)
            
            flush()
        }
    }
    
    //remote the project selected and flush
    private func removeProject(at offsets: IndexSet) {
        for index in offsets {
            let temp = projects[index]
            user.removeFromProjects(temp)
            viewContext.delete(temp)
        }
        
        flush()
    }
    //flush results back to the database, it calls userModel.flush() with the current context
    func flush(){
        userModel.flush(viewContext: viewContext)
    }
}
