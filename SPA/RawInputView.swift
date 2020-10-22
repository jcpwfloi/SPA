//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//

import SwiftUI



struct InputView: View{
    var name: String
    var placeholder: String
    var spacerWidth : CGFloat = 20.0
    var labelWidth : CGFloat = 300.0
    @Binding var textInput: String
    var body: some View {
        HStack{
            
            HStack{
                Spacer().frame(width: spacerWidth)
                Text(name)
                    .font(.headline)
            }
            
            .frame(width:labelWidth, alignment: .bottomTrailing)
            
            Spacer().frame(width: spacerWidth)
            TextField(placeholder, text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer().frame(width: spacerWidth)
        }.padding()
    }
}

struct RawInputView: View {
    @ObservedObject var model : SPAModel = SPAModel()
    @EnvironmentObject var viewState: ViewState
    @State private var action: Int? = 0
    func disabled()->Bool{
        for rawInput in model.rawInputTags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
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
                        model.compute()
                        viewState.model = model
                        self.action = 1
                }
                Text(" Executive ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        model.compute()
                        viewState.model = model
                        self.action = 2
                }
                Text(" Management ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        model.compute()
                        viewState.model = model
                        self.action = 1
                }
                Text(" Practitioner ").font(.title2).padding() .border(Color.black)
                    .onTapGesture {
                        model.compute()
                        viewState.model = model
                        self.action = 2
                }
            }.padding(30)
        }
    }
}
//
struct RawInputView_Previews: PreviewProvider {
    static var previews: some View {
        RawInputView()
    }
}
