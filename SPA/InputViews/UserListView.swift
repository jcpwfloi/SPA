//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

//This is the user list screen. It allows
//the app user to see the list of a users (engineering labs/teams).
//It also allows for the creation and deletion of users.

struct UserListView: View {
    @Environment(\.managedObjectContext) private var viewContext //Global context of the core data module
    
    //Fetch the users in the database
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    
    @EnvironmentObject var user: UserModel //Global user model used to maintain global app logic
    
    @State private var newName: String = ""  //The String textfield input for the name of the new user
    @State private var showAddAlert = false  //Controls the visibility of the add alert
    @State private var showingAddSheet = false  //Controls the visibility of the popup add user sheet
    
    @State private var deleteIndexSet: IndexSet?
    @State private var showingDeleteAlert = false //Controls the visibility of the delete alert
    @State private var errMsg = "Empty Username" //Error message shown on the new project input alert
    @State private var error = false //Controls the visibility of invalid new user input alert
    var body: some View {
        //The add button on the popup
        let popUpAddButton =
            Button("Add") {
                if let validatedName = checkValid(name: newName) {
                    addUser(name: validatedName)
                    self.showingAddSheet.toggle()
                }
                else{
                    error = true
                }
            }
        //the dismmiss button on the popup
        let popUpDismissButton =
            Button(action: {
                self.showingAddSheet.toggle()
            }){
                Text("Dismiss")
            }.foregroundColor(.red)
            .accessibilityIdentifier("Dismiss")
        //the add user popup
        let addUserPopup =
            NavigationView {
                Form {
                    Section {
                        TextField("Enter New User Name", text: $newName).accessibilityLabel("new user field")
                    }
                    popUpAddButton
                    popUpDismissButton
                }.navigationTitle("Add a New User")
            }
            .alert(isPresented: $error) {
                Alert(title: Text("Error"), message: Text(errMsg))
            }
        
        //the add button on the main screen
        let addButton =
            Button(action: {
                self.showingAddSheet.toggle()
            }) {
                Image(systemName: "person.badge.plus.fill")
                    .font(Font.system(.title).bold())
            }.sheet(isPresented: $showingAddSheet){
                addUserPopup
            }.accessibilityIdentifier("Add a user")
        
        //the log out button
        let logoutButton =
            Button(action: {
                user.logout()
            }) {
                Text("Log off")
            }
        
        //The buttons on the navigation bar
        let navigationButtons =
            HStack {
                addButton
                Spacer()
                Spacer()
                Spacer()
                logoutButton
            }
        
        //the view that displays the user list
        let userList =
            List {
                ForEach(users, id: \.self) { myUser in
                    NavigationLink(destination: ProjectListView(user: myUser)
                                    .environment(\.managedObjectContext, viewContext)) {
                        Text("\(myUser.username ?? "Not set")")
                    }
                }.onDelete(perform: deleteUser)
            }
        
        //the delete alert
        let deleteAlert =
            Alert(title: Text("Warning"), message: Text("Do you surely want to delete the item?"), primaryButton: .destructive(Text("Delete")) {
                if let iset = deleteIndexSet {
                    removeUser(at: iset)
                }
            } , secondaryButton: .cancel())
        
        //conditional views on the main screen
        NavigationView {
            VStack {
                if users.count > 0 {
                    userList
                        .navigationBarTitle(Text("User List"))
                        .navigationBarItems(trailing: navigationButtons)
                } else {
                    Text("Empty")
                        .navigationBarTitle(Text("User List"))
                        .navigationBarItems(trailing: navigationButtons)
                }
            }
        }.alert(isPresented: $showingDeleteAlert) {
            deleteAlert
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //Delete a user
    private func deleteUser(at offsets: IndexSet) {
        self.deleteIndexSet = offsets
        self.showingDeleteAlert = true
    }
    
    //check if the new user name is valid
    private func checkValid(name : String) -> String?{
        //check if empty
        if(name.isEmpty){
            errMsg = "Empty Username"
            return nil
        }
        //Delegate to the validation module
        let result = validateInputParameter(name,tag:projectNameValidationTag)
        if(result == nil){
            errMsg = "Invalid Username"
            return nil
        }
        //Check for repeated names
        for user in users{
            if(user.username == result!.1!){
                errMsg = "Username already existed"
                return nil
            }
        }
        //return the validated name
        return result!.1!
    }
    
    //add a new user and flush
    private func addUser(name: String) {
        withAnimation {
            let newUser = User(context: viewContext)
            newUser.username = name
            
            flush()
        }
    }
    
    //remove a user and flush
    func removeUser(at offsets: IndexSet) {
        for index in offsets {
            let temp = users[index]
            
            let projects = temp.projects as? Set<Project> ?? []
            
            for project in projects {
                viewContext.delete(project)
            }
            
            viewContext.delete(temp)
        }
        
        flush()
    }
    
    //flush results back to the database, it calls userModel.flush() with the current context
    func flush(){
        user.flush(viewContext: viewContext)
    }
}
