//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//
import SwiftUI




struct RawInputView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var model : SPAModel
    @EnvironmentObject var viewState: ViewState
    @State private var action: Int? = 0
    @State var error: Bool = false
    
    @State var showNewView = false
    
    @State var alertMsg = "Invalid Input"
    
    func disabled() -> Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    func validate() -> Int{
        return model.validate()
    }
    
    var body: some View {
        let GenerateButton = Button("Generate") {
            generateResults()
                    }.disabled(disabled())
        VStack {
            Form {
                Section(header: Text("Details")) {
                    ForEach(model.rawInputTags.indices) { idx in
                        HStack {
                            Text(model.rawInputTags[idx].name).bold()
                            Spacer().frame(width: 30)
                            TextField(model.rawInputTags[idx].placeholder, text: $model.rawInputTags[idx].textInput)
                                .multilineTextAlignment(.trailing).accessibilityIdentifier(model.rawInputTags[idx].name)
//                            Text(model.rawInputUnits[idx]).multilineTextAlignment(.leading)
                        }
                    }
                    
                }
                
            }.alert(isPresented: $error) {
                Alert(title: Text("Error"), message: Text(alertMsg))
            }
            NavigationLink(
                destination: GeneratedView().environment(\.managedObjectContext, viewContext),
                isActive: $showNewView
            ) {
                EmptyView()
            }
        }
        
        .navigationTitle("Project Details - \(model.project.name ?? "")")
        .navigationBarItems(trailing: GenerateButton)
    }
    
    private func generateResults(){
        let violated = validate()
        if (violated == -1){
            
            let result = model.compute()
            if(result){
                viewState.model = model
                saveProjectDetails()
                self.showNewView.toggle()
            }
            else{
                alertMsg = "Error in computataion Engine"
                error = true
            }
        }
        else{
            if(violated == 11){
                alertMsg = "Unexpected Err"
            }
            else{
                alertMsg = "Invalid Input: " + model.rawInputTags[violated].name + "\nFormat: " + model.rawInputTags[violated].placeholder
            }
            error = true
        }

    }
    
    private func saveProjectDetails() {
        model.save()
        flush()
    }
    
    private func flush(){
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}


