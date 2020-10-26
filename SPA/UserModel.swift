//
//  UserModel.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-15.
//

import Combine

class UserModel : ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isLoggedin = false
    
    func login(_ username: String, _ password: String) -> Bool {
//        if username == "admin" && password == "admin123" {
            self.isLoggedin = true
            return true
//        }
//        return false
    }
    
    func logout() {
        self.isLoggedin = false
    }
}
