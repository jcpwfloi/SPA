//
//  UserModel.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-15.
//
import SwiftUI
import Combine
import CoreData

//This is the "app user" model that controls global logic of login/logoff
//and data synchronization

class UserModel : ObservableObject {
    
    @Published var username: String = ""  //The logged in username
    @Published var password: String = "" //the logged in password
    
    @Published var isLoggedin = false  //Is the app user logged in?
    
    //Test if the inputed username and password is valid
    func login(_ username: String, _ password: String, _ viewContext: NSManagedObjectContext) -> Bool {
        //hardwired default username and password
        if (username == "SofTechMetrics@gmail.com" && password == "Admin") {
            self.isLoggedin = true
            return true
        }
        //fetch the registered app users
        let request: NSFetchRequest<Auth> = Auth.fetchRequest()
        request.predicate = NSPredicate(format: "email == \"" + username + "\"")
        do {
            let user: [Auth] = try viewContext.fetch(request)
            if user.count > 0 {
                let a = user[0]
                if password == (a.password ?? "") {
                    self.isLoggedin = true
                    return true
                }
            }
            return false
        } catch {
            
        }
        return false
    }
    
    //flush the persisted data back to the DB corresponding to a certain view context
    func flush(viewContext:NSManagedObjectContext){
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    //logoff, could select not to exit and it will return to the login screen
    func logout() {
        isLoggedin = false;
        exit(0)
    }
}
