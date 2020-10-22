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
                           RawInput(name: "NonCommentNonBlankSLOC", placeholder: "NonCommentNonBlankSLOC", textInput:inputNumNcSloc),
                           RawInput(name: "Requirements and Design Effort", placeholder: "Requirements and Design Effort", textInput: inputReqDesEffort),
                           RawInput(name: "Development Effort", placeholder: "Development Effort", textInput: inputDevEffort),
                           RawInput(name: "Find Defect Effort", placeholder: "Find Defect Effort", textInput: inputFindDefectEffort),
                           RawInput(name: "Rework Effort", placeholder: "Rework Effort", textInput: inputReworkEffort),
                           RawInput(name: "Issue Count", placeholder: "Issue Count", textInput:inputIssueCount),
                           RawInput(name: "Post-Release Indicator", placeholder: "Post-Release Indicator", textInput: inputPostReleaseIndicator)]
    
    @Published var derivedInputTags = ["Team Size", "Labor Rate","Total Project Hours", "Development Effort Percent", "Test Effort Percent", "Programming Language Level","NumNcnbSloc", "Number of Issues","Est Number of Severity 1 Issues","Est Number of Severity 2 Issues","Est Number of Severity 3 Issues","Est Number of Severity 4 Issues"]
    @Published var executiveTags = ["Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Sofware Poor Quality Risk", "Est Complette Early", "Est   Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Durattion"]
    @Published var managementTags = ["Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Sofware Poor Quality Risk", "Est Complette Early", "Est   Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Durattion"]
    @Published var practionerTags = ["CMMI Maturity Level", "Programming Productivity", "Est PreRelease Defects", "Est PostRelease Defects", "Est Expected Delivered Defects", "Est PreRelease Design Defects", "Est PreRelease Code Defects", "Est PreRelease Test Defects", "Est PreRelease Documentation Defects", "Est PreRelease Bad-Fix Defects", "Software Defect Density", "Industry Average Defect Density", "Est Requirement Defects Left", "Est Design Detects Left", "Est Code Defects Left", "Est Security Defects Left", "Est User Documentation Defects Left", "Est Test Defects Left", "Est Bad-Fix Defects Left", "Est Defects per Engineering Month", "Est Softwre Inspection Productivity", "Est Quality Assurance Productivity", "Est Defets Leaked to Users", "Est Project Defefct Removal Efficiencty", "Est Capability-Based DRE", "Est US Average DRE", "Est US Average DDE", "Est Find Fix Effort Per Defect", "Est Avg Find Fix Effort per Defec t", "Est Unit Cost per Engineering Month", "Est Find Fix Percentage", "Est Project Effort", "Est Requirements Effort", "Est Design Effort", "Est Code Effort", "Est Test Effort", "Est Total Project Staffing", "Est Requirements Staffing", "Est Design Staffing", "Est Coding Staffing", "Est Test Staffing", "Est Project Duration", "Est Design, Code & Test Cost", "Est Team Cost per Engineering Month", "Est Cost of Quality", "Est Technical Debt", "Est Total Development Cost", "Est Lifetime Maintenance Cost", "Est Total Project Cost", "Est Agile Invested Savings", "Est Cost-Effectiveness Indicator"]
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
