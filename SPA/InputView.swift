//
//  InputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
//

import Foundation

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
