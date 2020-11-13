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
    @State var violated: Bool = false
    @State var error: Bool = false
    
    @State var showNewView = false
    
    var alertMsg = "Invalid Input"
    
    func disabled() -> Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    func validate() -> Bool{
        let checked = model.validate()
        violated = !checked
        return checked
    }
    
    var body: some View {
        let GenerateButton = Button("Generate") {
            
            if (validate()){
                
                let result = model.compute()
                if(result){
                    viewState.model = model
                    saveProjectDetails()
                    self.showNewView.toggle()
                }
                else{
                    error = true
                }
            }
            
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
                
                .alert(isPresented: $error) {
                    Alert(title: Text("Error"), message: Text("Error in computataion Engine"))
                }
            }.alert(isPresented: $violated) {
                Alert(title: Text("Violation"), message: Text(alertMsg))
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
    
    private func saveProjectDetails() {
        model.save()
        
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


