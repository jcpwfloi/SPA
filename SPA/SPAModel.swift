//
//  RawInputItems.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/14/20.
//

import Foundation
import SwiftUI
import Combine


class SPAModel : ObservableObject {
    var projectName = ""
    var projectId = ""
    var projectProgrammingLanguage = ""
    var projectAvgAnnualSalary = 0.0
    var projectTeamSize = 0.0
    var projectNcSloc = 0.0
    var projectReqDesEffort = 0.0
    var projectDevEffort = 0.0
    var projectFindDefectEffort = 0.0
    var projectReworkEffort = 0.0
    var projectIssueCount = 0.0
    var projectPostReleaseIndicator = ""
    @Published var rawInputTags : [RawInput]
    @Published var derivedInputTags = ["Project Name","Project Team Size", "Labor Rate","Total Project Hours", "Development Effort Percent", "Test Effort Percent", "Programming Language Level","NumNcnbSloc", "Number of Issues","Est Number of Severity 1 Issues","Est Number of Severity 2 Issues","Est Number of Severity 3 Issues","Est Number of Severity 4 Issues"]
    @Published var executiveTags = ["Project Name", "Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Software Poor Quality Risk", "Est Complete Early", "Est Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Duration"]
    @Published var managementTags = ["Project Name","Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Software Poor Quality Risk", "Est Complete Early", "Est Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Duration"]
    @Published var practionerTags = ["Programming Productivity", "Est PreRelease Defects", "Est PostRelease Defects", "Est Expected Delivered Defects", "Est PreRelease Design Defects", "Est PreRelease Code Defects", "Est PreRelease Test Defects", "Est PreRelease Documentation Defects", "Est PreRelease Bad-Fix Defects", "Software Defect Density", "Industry Average Defect Density", "Est Requirement Defects Left", "Est Design Defects Left", "Est Code Defects Left", "Est Security Defects Left", "Est User Documentation Defects Left", "Est Test Defects Left", "Est Bad-Fix Defects Left", "Est Defects per Engineering Month", "Est Software Inspection Productivity", "Est Quality Assurance Productivity", "Est Defects Leaked to Users", "Est Project Defect Removal Efficiency", "Est Capability-Based DRE", "Est US Average DRE", "Est US Average DDE", "Est Find Fix Effort Per Defect", "Est Avg Find Fix Effort per Defect", "Est Unit Cost per Engineering Month", "Est Find Fix Percentage", "Est Project Effort", "Est Requirements Effort", "Est Design Effort", "Est Code Effort", "Est Test Effort", "Est Total Project Staffing", "Est Requirements Staffing", "Est Design Staffing", "Est Coding Staffing", "Est Test Staffing", "Est Project Duration", "Est Design, Code & Test Cost", "Est Team Cost per Engineering Month", "Est Cost of Quality", "Est Technical Debt", "Est Total Development Cost", "Est Lifetime Maintenance Cost", "Est Total Project Cost", "Est Agile Invested Savings"]
    var rawInputUnits = ["", "", " in US$", " Staff Persons", " NcSloc", " Ehrs", " Ehrs", " Ehrs", " Ehrs", " Issues", ""]
    @Published var dict = [String : String]()
    var project : Project
    var rawInputValidationTags = [projectNameValidationTag,programmingLanguageValidationTag,inputAvgAnnualSalaryValidationTag,teamSizeValidationTag,ncSlocValidationTag,reqDesEffortValidationTag,devEffortValidationTag,findDefectEffortValidationTag,reworkEffortValidationTag,issueCountValidationTag,postReleaseIndicatorTag]
    
    init(project: Project) {
        
        self.project = project
        let details = project.details!
        let projectName = details.projectName!
        let programmingLanguage = details.projectProgrammingLanguage!
        let inputAvgAnnualSalary = details.projectAvgAnnualSalary.toString()
        let inputTeamSize = details.projectTeamSize.toString()
        let inputNumNcSloc = details.projectNcSloc.toString()
        let inputReqDesEffort = details.projectReqDesEffort.toString()
        let inputDevEffort = details.projectDevEffort.toString()
        
        let inputFindDefectEffort =  details.projectFindDefectEffort.toString()
        let inputReworkEffort = details.projectReworkEffort.toString()
        let inputIssueCount = details.projectIssueCount.toString()
        let inputPostReleaseIndicator = details.projectPostReleaseIndicator!
        rawInputTags =
            [RawInput(name: "Project Name", placeholder: "Project Name", textInput: projectName),
                                   RawInput(name: "Programming Language", placeholder: "Programming Language", textInput: programmingLanguage),
                                   RawInput(name: "Average Annual Salary", placeholder: "<50,000, 999999, 200,000> in US$", textInput: inputAvgAnnualSalary),
                                   RawInput(name: "Team Size", placeholder: "<1, 9999, 2000> Staff Persons", textInput: inputTeamSize),
                                   RawInput(name: "NonCommentNonBlankSLOC", placeholder: "<3000, 999999999, 100,000,000> NcSloc", textInput:inputNumNcSloc),
                                   RawInput(name: "Requirements and Design Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputReqDesEffort),
                                   RawInput(name: "Development Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputDevEffort),
                                   RawInput(name: "Find Defect Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputFindDefectEffort),
                                   RawInput(name: "Rework Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputReworkEffort),
                                   RawInput(name: "Issue Count", placeholder: "<1, 999999, 199,999> Issues", textInput:inputIssueCount),
                                   RawInput(name: "Post-Release Indicator", placeholder: "<'Y', 'N', 'y', 'n'>", textInput: inputPostReleaseIndicator)]
    }
    
    func save() {
        let details = project.details!
        details.projectName = projectName
        details.projectProgrammingLanguage = projectProgrammingLanguage
        details.projectAvgAnnualSalary = projectAvgAnnualSalary
        details.projectTeamSize = projectTeamSize
        details.projectNcSloc = projectNcSloc
        details.projectReqDesEffort = projectReqDesEffort
        details.projectDevEffort = projectDevEffort
        details.projectFindDefectEffort = projectFindDefectEffort
        details.projectReworkEffort = projectReworkEffort
        details.projectIssueCount = projectIssueCount
        details.projectPostReleaseIndicator = projectPostReleaseIndicator
    }
    
    func validate() -> Int{
        for i in 0...rawInputTags.count-1{
            let result = validateInputParameter(rawInputTags[i].textInput, tag:rawInputValidationTags[i])
            if(result == nil){
                print(i)
                print(rawInputTags[i].textInput)
                return i
            }
            else{
                switch i {
                case 0:
                    projectName = result!.1!
                case 1:
                    projectProgrammingLanguage = result!.1!
                case 2:
                    projectAvgAnnualSalary = result!.0!
                case 3:
                    projectTeamSize = result!.0!
                case 4:
                    projectNcSloc = result!.0!
                case 5:
                    projectReqDesEffort = result!.0!
                case 6:
                    projectDevEffort = result!.0!
                case 7:
                    projectFindDefectEffort = result!.0!
                case 8:
                    projectReworkEffort = result!.0!
                case 9:
                    projectIssueCount = result!.0!
                case 10:
                    projectPostReleaseIndicator = result!.1!
                    
                default:
                    return 11
                }
            }
        }
        return -1
    }
    
    func compute() -> Bool{
        let result = computeMetrics(projectId:projectId, projectProgrammingLanguage: projectProgrammingLanguage, projectAvgAnnualSalary: projectAvgAnnualSalary,projectTeamSize: projectTeamSize,projectNcSloc: projectNcSloc, projectReqDesEffort: projectReqDesEffort, projectDevEffort: projectDevEffort, projectFindDefectEffort: projectFindDefectEffort,projectReworkEffort: projectReworkEffort,projectIssueCount: projectIssueCount,projectPostReleaseIndicator: projectPostReleaseIndicator)
        
        if(result == nil) {
            return false
        }
        var metrics = result!
        
        metrics = metrics.sorted {$0.0 < $1.0}
        dict = computeMetrics(metrics)
        dict["Project Name"] = projectName
        return true
    }
    
    
}


