//
//  OutputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
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
                Text(text)
                    .frame(width:labelWidth)
            Spacer().frame(width: spacerWidth)
        }.padding()
    }
}
