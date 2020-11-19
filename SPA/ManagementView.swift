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
        
        VStack(alignment:.leading) {
            //Text("Management Screen").font(.system(.title)).bold().padding(.leading, 30)
            let tags = viewState.model!.managementTags
            Form {
                Section(header: Text("Details")) {
                    ForEach(tags.indices) {
                        OutputView(name: tags[$0], text:viewState.model!.dict[tags[$0]] ?? ""
                        )
                    }
                }
            }
            
        }
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}
