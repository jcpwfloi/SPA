//
//  DerivedInputScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/15/20.
//

import SwiftUI

//This is the derived input screen

struct DerivedInputView: View {
    @EnvironmentObject var sharedModel:SharedModel //The global state that contaains the current SPAModel
    
    var body: some View {
        VStack(alignment:.leading) {
            let tags = derivedInputTags
            Form {
                Section(header: Text("Details")) {
                    //Generate the list of outputs for the screen
                    ForEach(tags.indices) {
                        OutputView(name: tags[$0],text: sharedModel.model!.dict[tags[$0]] ?? "")
                    }
                }
            }
        }
    }
}
