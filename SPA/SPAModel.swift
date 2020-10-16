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
    
    @Published var rawInputTags = [RawInput(name: "Project Name", placeholder: "Project Name", textInput: projectName),
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
    
    @Published var derivedInputTags = ["Team Size", "Labor Rate","Total Project Hours", "Development Effort Percent", "Test Effort Percent", "Programming Language Level","NumNcnbSloc", "Number of Issues","Est Number of Severity 1 Issues","Est Number of Severity 2 Issues","Est Number of Severity 3 Issues","Est Number of Severity 4 Issues"]
    @Published var derivedInputIndices = [9,10,11,12,13,15,16,17,18,19,20,21]
    @Published var metrics: [(String, Double?, String?)]
    init(){
        projectId = "CMMILevel4Project"
        projectProgrammingLanguage = "Bliss"
        projectAvgAnnualSalary = 109953.0
        projectTeamSize = 9.0
        projectNcSloc = 100000.0
        projectReqDesEffort = 6420.0
        projectDevEffort = 18868.0
        projectFindDefectEffort = 1332.0
        projectReworkEffort = 600.0
        projectIssueCount = 200.0
        projectPostReleaseIndicator = "N"
        self.metrics = computeMetrics()!
        metrics = metrics.sorted {$0.0 < $1.0}
        
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
