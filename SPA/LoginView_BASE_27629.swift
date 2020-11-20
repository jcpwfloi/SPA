//
//  LoginView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-07.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Auth.email, ascending: true)],
        animation: .default)
    private var auths: FetchedResults<Auth>
    
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
    @State var errMsg = "Passwords don't match."
    var showAlert = false
    
    @ViewBuilder
    var body: some View {
        let registerButton = Button("Register", action: register)
            .alert(isPresented: $showingSuccessAlert) {
                Alert(title: Text("Note"), message: Text("Registration Successful."), dismissButton: .default(Text("Got it!")))
            }
        VStack {
            Text("Software Project Analytics")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)
            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            TextField("Email", text: $username)
                .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle()).accessibilityLabel("Username")
            SecureField("Password", text: $password)
                .padding(.top, 20.0)
                .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle()).accessibilityLabel("Password")
            HStack {
                Spacer().frame(width: 350, height: 50, alignment: .center)
                Button("x  clear", action: {
                    username=""
                    password = ""
                })
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(width: 100, height: 40)
                .cornerRadius(15.0)
            }
            Spacer().frame(width: 100, height: 10, alignment: .center)
            Button("Login", action: {
                if !user.login(username, password, viewContext) {
                    showingAlert = true
                }
            })
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 300, height: 40)
            .background(Color.blue)
            .cornerRadius(15.0)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Incorrect username or password"), dismissButton: .default(Text("Got it!")))
            }
            Divider().frame(width: 400).padding(20)
            HStack {
                Button("Register", action: {
                    self.showingRegister.toggle()
                })
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 40, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
                .sheet(isPresented: $showingRegister, content: {
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
                        Alert(title: Text("Error"), message: Text(errMsg), dismissButton: .default(Text("Got it!")))
                    }
                })
                Button("Logoff", action: {
                    user.logout()
                })
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 40, alignment: .center)
                .background(Color.red)
                .cornerRadius(15.0)
            }
        }
    }
    
    private func check() -> Bool{
        if(registerPassword != confirmPassword){
            errMsg = "Passwords don't match."
            return false
        }
        if(email.isEmpty || registerPassword.isEmpty || confirmPassword.isEmpty){
            errMsg = "Empty Fields"
            return false
        }
        if(!email.isValidEmail()){
            errMsg = "Invalid Email Address"
            return false
        }
        for auth in auths{
            if(email == auth.email){
                errMsg = "Email already existed"
                return false
            }
        }
        return true
    }
    
    private func register() {
        if (!check()) {
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
