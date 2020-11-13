//
//  LoginView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-07.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
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
    @State var showingSuccessAlert = false
    
    var showAlert = false
    
    @ViewBuilder
    var body: some View {
        let registerButton = Button("Register", action: register)
            .alert(isPresented: $showingSuccessAlert) {
                Alert(title: Text("Note"), message: Text("Registration Successful."), dismissButton: .default(Text("Got it!")))
            }
        
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
                if !user.login(username, password, viewContext) {
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
                    .navigationBarItems(trailing: registerButton)
                }.alert(isPresented: $showingRegisterAlert) {
                    Alert(title: Text("Error"), message: Text("Passwords don't match."), dismissButton: .default(Text("Got it!")))
                }
            }).padding(.top, 10.0)
        }
    }
    private func register() {
        if (registerPassword != confirmPassword) {
            showingRegisterAlert = true
        } else {
            var newAuth = Auth(context: viewContext)
            newAuth.email = email
            newAuth.password = registerPassword
            newAuth.realname = realname
            newAuth.number = number
            
            do {
                try viewContext.save()
                showingSuccessAlert = true
                showingRegister = false
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
