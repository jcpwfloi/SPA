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
    @ObservedObject var items : RawInputItems = RawInputItems()
    func disabled()->Bool{
        for rawInput in items.tags{
            if(rawInput.textInput.isEmpty){
                return true
            }
        }
        return false
    }
    
    var body: some View {
        
        VStack {
            HStack{
                Button(action: {}){
                    Text("Back")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                Button(action: {
                    exit(0)
                }){
                    Text("Log off")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                }
            }.padding(.leading, 80)
            .padding(.trailing, 60)
            .padding(.bottom, 100)
        
            ForEach(items.tags.indices){ idx in
                InputView(name: items.tags[idx].name, placeholder: items.tags[idx].placeholder,textInput: $items.tags[idx].textInput)
            }
            HStack{
                Button(action: {
                
                }){
                    Text(" Derived Input ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Executive ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Management ")
                        .font(.title2)

                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Practitioner ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
            }.padding(30)

        }
    }
}

struct RawInputView_Previews: PreviewProvider {
    static var previews: some View {
        RawInputView()
    }
}
