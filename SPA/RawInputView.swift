//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//
import SwiftUI

struct RawInputView: View {
    @ObservedObject var model : SPAModel = SPAModel()
    @EnvironmentObject var viewState: ViewState
    @State private var action: Int? = 0
    @State var violated: Bool = false
    func disabled()->Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    func validate()->Void{
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
        VStack {
            ForEach(model.rawInputTags.indices){ idx in
                InputView(name: model.rawInputTags[idx].name, placeholder: model.rawInputTags[idx].placeholder,textInput: $model.rawInputTags[idx].textInput)
            }
            HStack {
                NavigationLink(destination: DerivedInputView(), tag: 1, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: ExecutiveView(), tag: 2, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: ManagementView(), tag: 3, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: PractionerView(), tag: 4, selection: $action) {
                    EmptyView()
                }
                
                Text(" Derived Input ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        validate()
                        model.compute()
                        viewState.model = model
                        self.action = 1
                    }.disabled(disabled())
                Text(" Executive ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        validate()
                        model.compute()
                        viewState.model = model
                        self.action = 2
                }.disabled(disabled())
                Text(" Management ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        validate()
                        model.compute()
                        viewState.model = model
                        self.action = 3
                }.disabled(disabled())
                Text(" Practitioner ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        validate()
                        model.compute()
                        viewState.model = model
                        self.action = 4
                }.disabled(disabled())
            }.padding(30)
        }.alert(isPresented: $violated){
            Alert(title: Text("Violation"), message: Text("Invalid Input."))
        }
    }
}
struct RawInputView_Previews: PreviewProvider {
    static var previews: some View {
        RawInputView()
    }
}
