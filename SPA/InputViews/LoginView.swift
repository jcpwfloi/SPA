//
//  LoginView.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-07.
//

import SwiftUI

//This is the login view

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext //Global context of the core data module
    
    //Fetch the registered app users in the database
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Auth.email, ascending: true)],
        animation: .default)
    private var auths: FetchedResults<Auth>
    
    @ObservedObject var user: UserModel //Global user model used to maintain global app logic
    
    @State var username: String = "" //the inputed username
    @State var password: String = "" //the inputed password
    
    @State var email = "" //the email of a new user
    @State var registerPassword = "" //passwords of the new user
    @State var confirmPassword = "" //confirm
    @State var realname = "" //other info not mandatory
    @State var number = ""
    
    @State var showingAlert = false //showing login failure alert
    @State var showingRegister = false //showing the register panel
    @State var showingRegisterAlert = false //showing invalid registration input alert
    @State var showingSuccessAlert = false //showing registration successful
    @State var errMsg = "Passwords don't match." //the err message in the registration popup
    
    @ViewBuilder
    var body: some View {
        //the successful alert
        let registrationSuccessfulAlert =
            Alert(title: Text("Note"), message: Text("Registration Successful."), dismissButton: .default(Text("Got it!")))
        //the login failure alert
        let incorrectAlert =
            Alert(title: Text("Error"), message: Text("Incorrect username or password"), dismissButton: .default(Text("Got it!")))
        //register button on the registration popup
        let popUpRegisterButton =
            Button("Register", action: register)
            .alert(isPresented: $showingSuccessAlert) {
                registrationSuccessfulAlert
            }
            .accessibilityIdentifier("FormRegister")
        //title
        let title =
            Text("Software Project Analytics")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.top)
        
        //email input field
        let emailField =
            TextField("Email", text: $username)
            .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .textFieldStyle(RoundedBorderTextFieldStyle()).accessibilityLabel("Username")
        
        //password input field
        let passwordField =
            SecureField("Password", text: $password)
            .padding(.top, 20.0)
            .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .textFieldStyle(RoundedBorderTextFieldStyle()).accessibilityLabel("Password")
        
        //login button
        let loginButton =
            Button("Login", action: {
                //calls login() in the usermodel
                if !user.login(username, password, viewContext) {
                    showingAlert = true
                }
            })
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 300, height: 40)
            .background(Color.green)
            .cornerRadius(15.0)
            .alert(isPresented: $showingAlert) {
                incorrectAlert
            }
        
        //the clear button that clears both input boxes
        let clearButton =
            Button("x  clear", action: {
                username=""
                password = ""
            })
            .font(.footnote)
            .foregroundColor(.gray)
            .frame(width: 100, height: 40)
            .cornerRadius(15.0)
            .accessibilityIdentifier("Clear")
        
        //the clear button that clears the registration form
        let formClearButton =
            Button("Clear", action: {
                email = ""
                registerPassword = ""
                confirmPassword = ""
                realname = ""
                number = ""
            })
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .accessibilityIdentifier("FormClear")
        
        //the registration form on the popup
        let registrationForm =
            Form {
                Section(header: Text("UserInfo")) {
                    //Mandatory fields
                    HStack {
                        Text("Email").bold()
                        Spacer().frame(width: 30)
                        TextField("Email", text: $email)
                            .multilineTextAlignment(.trailing)
                            .accessibilityIdentifier("EmailField")
                    }
                    HStack {
                        Text("Password").bold()
                        Spacer().frame(width: 30)
                        SecureField("Password", text: $registerPassword)
                            .multilineTextAlignment(.trailing)
                            .accessibilityIdentifier("PasswordField")
                    }
                    HStack {
                        Text("Confirm Password").bold()
                        Spacer().frame(width: 30)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .multilineTextAlignment(.trailing)
                            .accessibilityIdentifier("ConfirmPasswordField")
                    }
                    
                    //Optional fields
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
                formClearButton
            }
        
        //the registration button on the main screen
        let registrationButton =
            Button("Register", action: {
                self.showingRegister.toggle()
            })
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 135, height: 40, alignment: .center)
            .background(Color.blue)
            .cornerRadius(15.0)
            .accessibilityIdentifier("Register")
        
        //the log off button
        let logoffButton =
            Button("Exit", action: {
                user.logout()
            })
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 135, height: 40, alignment: .center)
            .background(Color.red)
            .cornerRadius(15.0)
        
        //the registration error alert
        let registrationErrorAlert =
            Alert(title: Text("Error"), message: Text(errMsg), dismissButton: .default(Text("Got it!")))
        
        //the main sccreen
        VStack {
            title
            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            emailField
            passwordField
            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ZStack{
                HStack {
                    Spacer().frame(width: 375, height: 0, alignment: .center)
                    clearButton
                }
                loginButton
            }
            
            
            Divider().frame(width: 400).padding(5)
            HStack {
                //the registration button on the main screen will show the popup
                registrationButton
                    .sheet(isPresented: $showingRegister, content: {
                        NavigationView {
                            registrationForm
                                .navigationTitle("Register")
                                .navigationBarItems(trailing: popUpRegisterButton)
                        }.alert(isPresented: $showingRegisterAlert) {
                            registrationErrorAlert
                        }
                    })
                Spacer().frame(width: 30, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                logoffButton
            }
            
        }
    }
    
    /* @function check
    // @params none
    // @returns Bool
    // Returns true if the register constraints meet our requirements.
    */
    private func check() -> Bool{
        //check unmatched passwords
        if(registerPassword != confirmPassword){
            errMsg = "Passwords don't match."
            return false
        }
        
        //check for empty fields
        if(email.isEmpty || registerPassword.isEmpty || confirmPassword.isEmpty){
            errMsg = "Empty Fields"
            return false
        }
        
        //check if the email is valid
        if(!email.isValidEmail()){
            errMsg = "Invalid Email Address"
            return false
        }
        
        //check if user already existed
        for auth in auths{
            if(email == auth.email){
                errMsg = "Email already existed"
                return false
            }
        }
        return true
    }
    
    /* @function check
    // @params none
    // @returns none
    // Given all state variables, generate a new user and save to the database.
    */
    private func register() {
        if (!check()) {
            showingRegisterAlert = true
        } else {
            //created aa ew app user
            var newAuth = Auth(context: viewContext)
            newAuth.email = email
            newAuth.password = registerPassword
            newAuth.realname = realname
            newAuth.number = number
            
            //flush the results
            user.flush(viewContext: viewContext)
            showingSuccessAlert = true
            showingRegister = false
            
        }
    }
}
