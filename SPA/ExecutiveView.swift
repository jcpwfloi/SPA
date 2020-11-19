//
//  ExecutiveScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/21/20.
//

import SwiftUI




struct ExecutiveView: View {
    @EnvironmentObject var viewState: ViewState
    
    @State var metrics :[(String, Double?, String?)] = []
    var body: some View {
        
        VStack(alignment:.leading) {
            let tags = viewState.model!.executiveTags
            Form {
                Section(header: Text("Details")) {
                    ForEach(tags.indices) {
                        OutputView(name: tags[$0], text: viewState.model!.dict[tags[$0]] ?? ""
                        )
                    }
                }
            }
        }
    }
}

struct ExecutiveScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExecutiveView()
    }
}
