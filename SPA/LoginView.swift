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
    
    @State var email = ""
    @State var registerPassword = ""
    @State var confirmPassword = ""
    @State var realname = ""
    @State var number = ""
    
    @State var showingAlert = false
    @State var showingRegister = false
    @State var showingRegisterAlert = false
    
    var showAlert = false
    
    @ViewBuilder
    var body: some View {
        VStack {
            Text("Software Project Analytics")
                .font(.title)
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
                if !user.login(username, password) {
                    showingAlert = true
                }
            }).alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Incorrect username or password"), dismissButton: .default(Text("Got it!")))
            }.padding(.top, 30.0)
            Button("Register", action: {
                self.showingRegister.toggle()
            }).sheet(isPresented: $showingRegister, content: {
                NavigationView {
                    Form {
                        Section(header: Text("UserInfo")) {
                            HStack {
                                Text("Email").bold()
                                Spacer().frame(width: 30)
                                TextField("Email", text: $email)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Password").bold()
                                Spacer().frame(width: 30)
                                SecureField("Password", text: $registerPassword)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Confirm Password").bold()
                                Spacer().frame(width: 30)
                                SecureField("Confirm Password", text: $confirmPassword)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Actual Name").bold()
                                Spacer().frame(width: 30)
                                TextField("Actual Name", text: $realname)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Phone Number").bold()
                                Spacer().frame(width: 30)
                                TextField("Phone Number", text: $number)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        Button("Clear", action: {
                            email = ""
                            registerPassword = ""
                            confirmPassword = ""
                            realname = ""
                            number = ""
                        })
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                    }
                    .navigationTitle("Register")
                    .navigationBarItems(trailing: Button("Register") {
                        
                    })
                }
            }).alert(isPresented: $showingRegisterAlert) {
                Alert(title: Text("Error"), message: Text("Incorrect username or password"), dismissButton: .default(Text("Got it!")))
            }.padding(.top, 10.0)
        }
    }
}
