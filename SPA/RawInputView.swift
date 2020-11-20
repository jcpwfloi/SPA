//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//
import SwiftUI

//This is the rawinput screen that takes
//raw inputs directly and interact with the
//SPAModel

struct RawInputView: View {
    @Environment(\.managedObjectContext) private var viewContext //Global context of the core data module
    
    @ObservedObject var model : SPAModel //The current SPAModel that contains rawinputs and outputs
    @EnvironmentObject var sharedModel:SharedModel //The global state that contaains the current SPAModel
    @EnvironmentObject var userModel: UserModel //Global user model used to maintain global app logic
    @State var isLoading = false //showing the loading prompt
    @State var error: Bool = false //showinng the input error alert
    
    @State var showNewView = false //showing the output view
    @State var loadingMsg = "Loading..." //the loading msg
    @State var alertMsg = "Invalid Input" //the alert message of the error alert
    
    //If there are empty fields, the generate button will be disabled
    func disabled() -> Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    //delegate to model.validate
    func validate() -> Int{
        return model.validate()
    }
    
    var body: some View {
        //the generate button
        let generateButton = Button("Generate") {
            self.isLoading.toggle()
            
//            sleep(1)
            generateResults()
        }.disabled(disabled())
        
        
        //the logout  button
        let logoutButton = Button(action: {
            userModel.logout()
        }) {
            Text("Log off")
        }
        
        //buttons on the navigation bara
        let navigationButtons = HStack {
            generateButton
            Spacer()
            Spacer()
            Spacer()
            logoutButton
        }
        
        //the loading popup
        let loadingPopUp =
            VStack{
                Text(loadingMsg).font(.title)
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .frame(width: 300, height: 300)
            .background(Color.secondary.colorInvert())
            .foregroundColor(Color.primary)
            .cornerRadius(30)
            .isShowing(isLoading)
        
        //main screen
        VStack {
            ZStack{
                //the rawinput form
                Form {
                    Section(header: Text("Details")) {
                        //showing each rawinput field
                        ForEach(model.rawInputTags.indices) { idx in
                            HStack {
                                Text(model.rawInputTags[idx].name).bold()
                                Spacer().frame(width: 30)
                                TextField(model.rawInputTags[idx].placeholder, text: $model.rawInputTags[idx].textInput)
                                    .multilineTextAlignment(.trailing).accessibilityIdentifier(model.rawInputTags[idx].name)
                            }
                        }
                        
                    }
                    
                }.alert(isPresented: $error) {
                    Alert(title: Text("Error"), message: Text(alertMsg))
                }
                loadingPopUp
            }
            
            //navigate to the output screen
            NavigationLink(
                destination: GeneratedView().environment(\.managedObjectContext, viewContext),
                isActive: $showNewView
            ) {
                EmptyView()
            }
        }
        
        .navigationTitle("Project Details - \(model.project.name ?? "")")
        .navigationBarItems(trailing: navigationButtons)
    }
    
    //validate, compute and output
    private func generateResults(){
        //check if any violaation
        let violated = validate()
        //success
        if (violated == -1){
            loadingMsg = "Computing..."
            
            //compute the output
            let result = model.compute()
            //successful
            if(result){
                loadingMsg = "Saving..."
                sharedModel.setModel(model: model)
                saveProjectDetails()
                isLoading = false
                loadingMsg = "Validating..."
                self.showNewView.toggle()
            }
            else{
                //the computation engine failed
                alertMsg = "Error in computataion Engine"
                error = true
            }
        }
        else{
            //unknown err
            if(violated == 11){
                alertMsg = "Unexpected Err"
            }
            else{
                //validation failed
                alertMsg = "Invalid Input: " + model.rawInputTags[violated].name + "\nFormat: " + model.rawInputTags[violated].placeholder
            }
            //show error alert
            error = true
        }
        
    }
    
    //save the raw inputs
    private func saveProjectDetails() {
        model.save()
        flush()
    }
    
    //flush the results
    private func flush(){
        userModel.flush(viewContext: viewContext)
    }
}


