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
    
    func login() {
        self.isLoggedin = true
    }
    
    func logout() {
        self.isLoggedin = false
    }
}
