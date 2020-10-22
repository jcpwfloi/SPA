//
//  ExecutiveScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/21/20.
//

import SwiftUI




struct ManagementView: View {
    @EnvironmentObject var viewState: ViewState
    
    @State var metrics :[(String, Double?, String?)] = []
    var body: some View {
        
        VStack {
            
                        HStack{
                            Button(action: {
                                viewState.state = 100
                            }){
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
            let tags = viewState.model!.executiveTags
//            let indices = viewState.model!.derivedInputIndices
            
            ForEach(tags.indices) {
                OutputView(name: tags[$0], labelWidth:350,text: tags[$0])
            }
            
            
        }
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}
