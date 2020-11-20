//
//  RawInput.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
//

import SwiftUI

//This is the class for each rawinput "item"

class RawInput : ObservableObject{
    var name: String //the name of the raw input
    var placeholder: String //the placeholder to display the format and constrains
    @Published var textInput : String = "" //the state variable to store the inputed values
    
    init(name:String, placeholder:String, textInput:String){
        self.name = name
        self.placeholder = placeholder
        self.textInput = textInput
    }
}
