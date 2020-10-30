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
    
    func validate() -> Void{
        var checked = true
        for i in 0...model.rawInputTags.count-1{
            let result = validateInputParameter(model.rawInputTags[i].textInput, tag:model.rawInputValidationTags[i])
            if(result == nil){
                checked = false
                break
            }
        }
        violated = !checked
    }
    
    var body: some View {
        let GenerateButton = Button("Generate") {
            validate()
            model.compute()
            viewState.model = model
            self.showNewView.toggle()
        }
        VStack {
            Form {
                Section(header: Text("Details")) {
                    ForEach(model.rawInputTags.indices) { idx in
                        HStack {
                            Text(model.rawInputTags[idx].name).bold()
                            Spacer().frame(width: 30)
                            TextField(model.rawInputTags[idx].name, text: $model.rawInputTags[idx].textInput)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                }
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
