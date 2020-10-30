//
//  ExecutiveScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/21/20.
//

import SwiftUI




struct PractionerView: View {
    @EnvironmentObject var viewState: ViewState
    
    @State var metrics :[(String, Double?, String?)] = []
    var body: some View {
        
        VStack {
            let tags = viewState.model!.practionerTags
            List{
                ForEach(tags.indices) {
                    OutputView(name: tags[$0], labelWidth:350,text: viewState.model!.dict[tags[$0]] ?? "")
                }
                
            }
        }
    }
}

struct ProctionerView_Previews: PreviewProvider {
    static var previews: some View {
        PractionerView()
    }
}
