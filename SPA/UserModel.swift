//
//  UserModel.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-15.
//

import Combine
import CoreData

class UserModel : ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isLoggedin = false
    
    func login(_ username: String, _ password: String, _ viewContext: NSManagedObjectContext) -> Bool {
        print(username, password)
        let request: NSFetchRequest<Auth> = Auth.fetchRequest()
        request.predicate = NSPredicate(format: "email == \"" + username + "\"")
        do {
            let user: [Auth] = try viewContext.fetch(request)
            print(user)
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
    
    func logout() {
        self.isLoggedin = false
    }
}
