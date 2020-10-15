//
//  RawInputItems.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/14/20.
//

import Foundation
import SwiftUI
import Combine

class RawInputItems : ObservableObject{
    
    @Published var tags = [RawInput(name: "Project Name", placeholder: "Project Name"),
                RawInput(name: "Programming Language", placeholder: "Programming Language"),
                RawInput(name: "Average Annual Salary", placeholder: "Average Annual Salary"),
                RawInput(name: "Team Size", placeholder: "Team Size"),
                RawInput(name: "NonCommentNonBlankSLO", placeholder: "NonCommentNonBlankSLO"),
                RawInput(name: "Requirenents and Design Effort", placeholder: "Requirenents and Design Effort"),
                RawInput(name: "Development Effort", placeholder: "Development Effort"),
                RawInput(name: "Find Defect Effort", placeholder: "Find Defect Effort"),
                RawInput(name: "Rework Effort", placeholder: "Rework Effort"),
                RawInput(name: "Issue Count", placeholder: "Issue Count"),
                RawInput(name: "Requirenents and Design Effort", placeholder: "Requirenents and Design Effort")]
    
    
}

class RawInput : ObservableObject{
    var name: String
    var placeholder: String
    @Published var textInput : String = ""
    init(name:String, placeholder:String){
        self.name = name
        self.placeholder = placeholder
    }
}
