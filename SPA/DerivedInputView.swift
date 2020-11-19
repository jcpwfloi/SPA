//
//  DerivedInputScreen.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/15/20.
//
import SwiftUI

struct DerivedInputView: View {
    @EnvironmentObject var viewState: ViewState
    
    @State var metrics :[(String, Double?, String?)] = []
    var body: some View {
        VStack(alignment:.leading) {
            let tags = viewState.model!.derivedInputTags
            Form {
                Section(header: Text("Details")) {
                    ForEach(tags.indices) {
                        OutputView(name: tags[$0],text: viewState.model!.dict[tags[$0]] ?? ""
                        )
                    }
                }
            }
        }
    }
}
