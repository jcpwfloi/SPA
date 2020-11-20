//
//  OutputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
//
import SwiftUI

//this is the UI component to display each output item

struct OutputView: View{
    var name: String //the name of the output attribute
    @State var text: String //the text of the output
    
    var body: some View {
        HStack{
            Text(name).bold()
            //disallowing editing the output
            TextField("abc",text: $text).multilineTextAlignment(.trailing).allowsHitTesting(false)
        }
    }
}
