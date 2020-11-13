//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct UserListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
            animation: .default)
    private var users: FetchedResults<User>
    
    @EnvironmentObject var user: UserModel

    @State private var newName: String = ""
    @State private var showAddAlert = false
    @State private var showingAddSheet = false
    
    @State private var deleteIndexSet: IndexSet?
    @State private var showingDeleteAlert = false
    
    var body: some View {
        let AddUserPopup =
            NavigationView {
                Form {
                    Section {
                        TextField("Enter New User Name", text: $newName)
                    }
                    Button("Add") {
                        addUser(name: newName)
                        self.showingAddSheet.toggle()
                    }
                    Button(action: {
                        self.showingAddSheet.toggle()
                    }){
                        Text("Dismiss")
                    }.foregroundColor(.red)
                }.navigationTitle("Add a New User")
            }
        
        let AddButton = Button(action: {
            self.showingAddSheet.toggle()
        }) {
            Image(systemName: "person.badge.plus.fill")
                .font(Font.system(.title).bold())
        }.sheet(isPresented: $showingAddSheet){
            AddUserPopup
        }
        
        let LogoutButton = Button(action: {
            user.logout()
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
        
        NavigationView {
            VStack {
                if users.count > 0 {
                    List {
                        ForEach(users, id: \.self) { myUser in
                            NavigationLink(destination: ProjectListView(user: myUser)
                                            .environment(\.managedObjectContext, viewContext)) {
                                Text("\(myUser.username ?? "Not set")")
                            }
                        }.onDelete(perform: deleteUser)
                    }
                    .navigationBarTitle(Text("User List"))
                    .navigationBarItems(trailing: navigationButtons)
                } else {
                    Text("Empty")
                        .navigationBarTitle(Text("User List"))
                        .navigationBarItems(trailing: navigationButtons)
                }
            }
        }.alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Warning"), message: Text("Do you surely want to delete the item?"), primaryButton: .destructive(Text("Delete")) {
                if let iset = deleteIndexSet {
                    removeUser(at: iset)
                }
            } , secondaryButton: .cancel())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func deleteUser(at offsets: IndexSet) {
        self.deleteIndexSet = offsets
        self.showingDeleteAlert = true
    }
    
    private func addUser(name: String) {
            withAnimation {
                let newUser = User(context: viewContext)
                newUser.username = name

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
    
    func removeUser(at offsets: IndexSet) {
        for index in offsets {
            let temp = users[index]
            
            let projects = temp.projects as? Set<Project> ?? []
            
            for project in projects {
                viewContext.delete(project)
            }
            
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
