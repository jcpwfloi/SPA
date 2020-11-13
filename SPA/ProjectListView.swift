//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct ProjectListView: View{
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var newName: String = ""
    @State private var showAddAlert = false
    @State private var showingAddSheet = false
    
    @ObservedObject var user: User
    @EnvironmentObject var userModel: UserModel
    
    @State private var deleteIndexSet: IndexSet?
    @State private var showingDeleteAlert = false
    
    public var projects: [Project] {
        let set = user.projects as? Set<Project> ?? []
        return set.sorted {
            $0.name ?? "" < $1.name ?? ""
        }
    }
    
    var body: some View {
        let AddProjectPopup =
            NavigationView {
                Form {
                    Section {
                        TextField("Enter New Project Name", text: $newName)
                    }
                    Button("Add") {
                        addProject(name: newName, user: user)
                        self.showingAddSheet.toggle()
                    }
                    Button(action: {
                        self.showingAddSheet.toggle()
                    }){
                        Text("Dismiss")
                    }.foregroundColor(.red)
                }.navigationTitle("Add a New Project")
            }
        
        let AddButton = Button(action: {
            self.showingAddSheet.toggle()
        }) {
            Image(systemName: "person.badge.plus.fill")
                .font(Font.system(.title).bold())
        }.sheet(isPresented: $showingAddSheet){
            AddProjectPopup
        }
        .accessibilityIdentifier("Add Project")
        
        let LogoutButton = Button(action: {
            userModel.logout()
        }) {
            Text("Logout")
        }
        
        let navigationButtons = HStack {
            AddButton
            Spacer()
            Spacer()
            Spacer()
            LogoutButton
        }
        
        if projects != [] {
            List {
                ForEach(projects, id: \.self) { project in
                    NavigationLink(destination: RawInputView(project: project)
                            .environment(\.managedObjectContext, viewContext)) {
                        Text("\(project.name ?? "Not Set")")
                    }
                }.onDelete(perform: deleteProject)
            }
            .alert(isPresented: $showingDeleteAlert, content: {
                Alert(title: Text("Warning"), message: Text("Do you surely want to delete the item?"), primaryButton: .destructive(Text("Delete")) {
                    if let iset = deleteIndexSet {
                        removeProject(at: iset)
                    }
                } , secondaryButton: .cancel())
            })
            .navigationBarTitle(Text("Project List - \(user.username ?? "Null")"))
            .navigationBarItems(trailing: navigationButtons)
        } else {
            Text("Empty")
                .navigationBarTitle(Text("Project List - \(user.username ?? "Null")"))
                .navigationBarItems(trailing: navigationButtons)
        }
    }
    
    private func deleteProject(at offsets: IndexSet) {
        self.deleteIndexSet = offsets
        self.showingDeleteAlert = true
    }
    
    private func addProject(name: String, user: User) {
            withAnimation {
                let newProject = Project(context: viewContext)
                newProject.name = name
                
                let newProjectDetails = ProjectDetails(context: viewContext)
                newProjectDetails.projectId = "CMMILevel4Project"
                newProjectDetails.projectProgrammingLanguage = "Bliss"
                newProjectDetails.projectAvgAnnualSalary = 109953.0
                newProjectDetails.projectTeamSize = 9.0
                newProjectDetails.projectNcSloc = 100000.0
                newProjectDetails.projectReqDesEffort = 6420.0
                newProjectDetails.projectDevEffort = 18868.0
                newProjectDetails.projectFindDefectEffort = 1332.0
                newProjectDetails.projectReworkEffort = 600.0
                newProjectDetails.projectIssueCount = 200.0
                newProjectDetails.projectPostReleaseIndicator = "N"
                
                newProject.details = newProjectDetails
                
                user.addToProjects(newProject)

                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
    }
    
    private func removeProject(at offsets: IndexSet) {
        for index in offsets {
            let temp = projects[index]
            user.removeFromProjects(temp)
            viewContext.delete(temp)
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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
