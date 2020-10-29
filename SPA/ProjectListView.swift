//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct ProjectListView: View{
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var coreData: CoreData
    @State private var newName: String = ""
    @State private var showAddAlert = false
    @State private var showingAddSheet = false
    
    @ObservedObject var user: User
    var body: some View {
        let temp = user.projects as? Set<Project> ?? []
        let projects = Array(temp).sorted {
            $0.name ?? "" < $1.name ?? ""
        }
        if projects.count > 0 {
            List(projects) { project in
                NavigationLink(
                    destination: RawInputView()
                        .environment(\.managedObjectContext, viewContext)) {
                    Text("\(project.name ?? "Not Set")")
                }
            }.navigationBarTitle(Text("Project List"))
            .navigationBarItems(trailing:
                            Button("Add") {
                                self.showingAddSheet.toggle()
                            }.sheet(isPresented: $showingAddSheet) {
                                ZStack {
                                    VStack {
                                        TextField("Enter New Project Name", text: $newName)
                                        Button("add") {
                                            addProject(name: newName, user: user)
                                            self.showingAddSheet.toggle()
                                        }.font(.title)
                                        Button(action: {
                                            self.showingAddSheet.toggle()
                                        }){
                                            Text("Dismiss")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
                            }
            )
        } else {
            Text("Project List is Empty, add a project below.")
            .navigationBarTitle(Text("Project List"))
                .navigationBarItems(trailing:
                                Button("Add") {
                                    self.showingAddSheet.toggle()
                                }.sheet(isPresented: $showingAddSheet){
                                    ZStack {
                                        VStack {
                                            TextField("Enter New Project Name", text: $newName)
                                            Button("add") {
                                                addProject(name: newName, user: user)
                                                self.showingAddSheet.toggle()
                                            }.font(.title)
                                            Button(action: {
                                                self.showingAddSheet.toggle()
                                            }){
                                                Text("Dismiss")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            }
                                        }
                                    }
                                }
                )
        }
    }
    private func addProject(name: String, user: User) {
            withAnimation {
                let newProject = Project(context: viewContext)
                newProject.name = name
                
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
}
//#if DEBUG
//struct ProjectListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectListView(user: "U1")
//    }
//}
//#endif
