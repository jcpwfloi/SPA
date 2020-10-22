//
//  DerivedInputScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/15/20.
//

import Foundation

import SwiftUI



struct OutputView: View{
    var name: String
    var spacerWidth : CGFloat = 20.0
    var labelWidth : CGFloat = 300.0
    var text: String
    var body: some View {
        HStack{
            
            HStack{
                Spacer().frame(width: spacerWidth)
                Text(name)
                    .font(.headline)
            }
            
            .frame(width:labelWidth, alignment: .bottomTrailing)
            
            Spacer().frame(width: spacerWidth)
//            if text != nil {
                Text(text)
                    .frame(width:labelWidth)
//            }
            Spacer().frame(width: spacerWidth)
        }.padding()
    }
}

struct DerivedInputView: View {
//    @ObservedObject var model : SPAModel
    @EnvironmentObject var viewState: ViewState
    
    @State var metrics :[(String, Double?, String?)] = []
    var body: some View {
        
        VStack {
            
                        HStack{
                            Button(action: {
                                exit(0)
                            }){
                                Text("Log off")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
                            }
                        }.padding(.leading, 80)
                        .padding(.trailing, 60)
                        .padding(.bottom, 100)
            let tags = viewState.model!.derivedInputTags
            let indices = viewState.model!.derivedInputIndices
            
            List{
                ForEach(tags.indices) {
                    OutputView(name: tags[$0], text: String((viewState.model!.metrics[indices[$0]].1)!))
                }
                
            }
        }
    }
}

struct DerivedInputView_Previews: PreviewProvider {
    static var previews: some View {
        DerivedInputView()
    }
}
