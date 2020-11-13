//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//
import SwiftUI




struct RawInputView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var model : SPAModel = SPAModel()
    @EnvironmentObject var viewState: ViewState
    @State private var action: Int? = 0
    @State var violated: Bool = false
    
    @State var showNewView = false
    
    var project: Project
    
    func disabled() -> Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    func validate() -> Bool{
        var checked = true
        for i in 0...model.rawInputTags.count-1{
            let result = validateInputParameter(model.rawInputTags[i].textInput, tag:model.rawInputValidationTags[i])
            if(result == nil){
                print(i)
                checked = false
                break
            }
        }
        violated = !checked
        return checked
    }
    
    var body: some View {
        let GenerateButton = Button("Generate") {
            
            if(validate()){
                model.compute()
                viewState.model = model
                
                self.showNewView.toggle()
            }
            
        }.disabled(disabled())
        VStack {
            Form {
                Section(header: Text("Details")) {
                    ForEach(model.rawInputTags.indices) { idx in
                        HStack {
                            Text(model.rawInputTags[idx].name).bold()
                            Spacer().frame(width: 30)
                            TextField(model.rawInputTags[idx].name, text: $model.rawInputTags[idx].textInput)
                                .multilineTextAlignment(.trailing).accessibilityIdentifier(model.rawInputTags[idx].name)
                        }
                    }
                    
                }
            }.alert(isPresented: $violated) {
                Alert(title: Text("Violation"), message: Text("Invalid Input"))
            }
            NavigationLink(
                destination: GeneratedView().environment(\.managedObjectContext, viewContext),
                isActive: $showNewView
            ) {
                EmptyView()
            }
        }
        
        .navigationTitle("Project Details - \(project.name ?? "")")
        .navigationBarItems(trailing: GenerateButton)
    }
}
