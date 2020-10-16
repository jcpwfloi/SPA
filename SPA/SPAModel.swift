//
//  RawInputItems.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/14/20.
//

import Foundation
import SwiftUI
import Combine

class SPAModel : ObservableObject{
    
    @Published var tags = [RawInput(name: "Project Name", placeholder: "Project Name", textInput: projectName),
                           RawInput(name: "Programming Language", placeholder: "Programming Language", textInput: programmingLanguage),
                           RawInput(name: "Average Annual Salary", placeholder: "Average Annual Salary", textInput: inputAvgAnnualSalary),
                           RawInput(name: "Team Size", placeholder: "Team Size", textInput: inputTeamSize),
                           RawInput(name: "NonCommentNonBlankSLO", placeholder: "NonCommentNonBlankSLO", textInput:inputNumNcSloc),
                           RawInput(name: "Requirenents and Design Effort", placeholder: "Requirenents and Design Effort", textInput: inputReqDesEffort),
                           RawInput(name: "Development Effort", placeholder: "Development Effort", textInput: inputDevEffort),
                           RawInput(name: "Find Defect Effort", placeholder: "Find Defect Effort", textInput: inputFindDefectEffort),
                           RawInput(name: "Rework Effort", placeholder: "Rework Effort", textInput: inputReworkEffort),
                           RawInput(name: "Issue Count", placeholder: "Issue Count", textInput:inputIssueCount),
                           RawInput(name: "Post-Release Indicator", placeholder: "Post-Release Indicator", textInput: inputPostReleaseIndicator)]
    
    @Published var metrics: [(String, Double?, String?)]?
    init(){
        self.metrics = computeMetrics()
    }
    
    
}

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
