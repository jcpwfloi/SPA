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
//            HStack{
//                Button(action: {}){
//                    Text("Back")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                }
//                Spacer()
//                Button(action: {
//                    exit(0)
//                }){
//                    Text("Log off")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        
//                }
//            }.padding(.leading, 80)
//            .padding(.trailing, 60)
//            .padding(.bottom, 100)
        
            ForEach(model.rawInputTags.indices){ idx in
                InputView(name: model.rawInputTags[idx].name, placeholder: model.rawInputTags[idx].placeholder,textInput: $model.rawInputTags[idx].textInput)
            }
            HStack{
       
                    Button(action: {
                        viewState.state = 1
                        viewState.model = model
                    }){
                        Text(" Derived Input ")
                            .font(.title2)
                    }.padding()
                    .disabled(disabled())
                Button(action: {
                    viewState.state = 2
                    viewState.model = model
                }){
                    Text(" Executive ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
                Button(action: {
                    viewState.state = 3
                    viewState.model = model
                }){
                    Text(" Management ")
                        .font(.title2)

                }.padding()
                .disabled(disabled())
                Button(action: {
                    viewState.state = 3
                    viewState.model = model
                }){
                    Text(" Practitioner ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
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
