//
//  ExecutiveScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/21/20.
//

import SwiftUI

//This is the executive screen

struct ExecutiveView: View {
    @EnvironmentObject var sharedModel:SharedModel //The global state that contaains the current SPAModel
    
    var body: some View {
        VStack(alignment:.leading) {
            let tags = executiveTags
            Form {
                Section(header: Text("Details")) {
                    //Generate the list of outputs for the screen
                    ForEach(tags.indices) {
                        OutputView(name: tags[$0], text: sharedModel.model!.dict[tags[$0]] ?? "")
                    }
                    
                }
            }
        }
    }
}
