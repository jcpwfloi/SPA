//
//  RawInput.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
//

import SwiftUI

class RawInput : ObservableObject{
    var name: String
    var placeholder: String
    @Published var textInput : String = ""
    init(name:String, placeholder:String, textInput:String){
        self.name = name
        self.placeholder = placeholder
        self.textInput = textInput
    }
}
