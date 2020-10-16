//
//  LoginView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-07.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user: UserModel
    
    @State var username: String = ""
    @State var password: String = ""
    
    @ViewBuilder
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Login"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)
            TextField("Username", text: $username)
                .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .padding(.top, 20.0)
                .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login", action: {
                user.login()
            })
            
            
            .padding(.top, 30.0)
        }
    }
}
