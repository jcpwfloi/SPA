//
//  RawInputItems.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/14/20.
//

import Foundation
import SwiftUI
import Combine

//This is the core of the app.
//It's a model that wraps the data related to a specific project
//It also contains the output

class SPAModel : ObservableObject {
    //the real rawinput variables transformed from string
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
    
    //the rawinput "items"
    @Published var rawInputTags : [RawInput]
    
    //the output dictionary; use the attribute name to get the string results
    @Published var dict = [String : String]()

    //the project object of the details
    var project : Project
    
    
    init(project: Project) {
        //transform raw inputs into strings
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
        
        //initialize the rawinput items
        rawInputTags =
            [RawInput(name: "Project Name", placeholder: "Project Name", textInput: projectName),
             RawInput(name: "Programming Language", placeholder: "Programming Language", textInput: programmingLanguage),
             RawInput(name: "Average Annual Salary", placeholder: "<50,000, 999999, 200,000> in US$", textInput: inputAvgAnnualSalary),
             RawInput(name: "Team Size", placeholder: "<1, 9999, 2000> Staff Persons", textInput: inputTeamSize),
             RawInput(name: "Number Of NonCommentNonBlankSLOC", placeholder: "<3000, 999999999, 100,000,000> NcSloc", textInput:inputNumNcSloc),
             RawInput(name: "Requirements and Design Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputReqDesEffort),
             RawInput(name: "Development Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputDevEffort),
             RawInput(name: "Find Defect Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputFindDefectEffort),
             RawInput(name: "Rework Effort", placeholder: "<1, 9999999, 2,000,000> Ehrs", textInput: inputReworkEffort),
             RawInput(name: "Issue Count", placeholder: "<1, 999999, 199,999> Issues", textInput:inputIssueCount),
             RawInput(name: "Post-Release Indicator", placeholder: "<'Y', 'N', 'y', 'n'>", textInput: inputPostReleaseIndicator)]
    }
    
    //save the results back to project details persisted
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
    
    //calls the validation module to validate the results.
    //returns -1 if successful
    //returns the index of the first invalid input if not
    func validate() -> Int{
        for i in 0...rawInputTags.count-1{
            let result = validateInputParameter(rawInputTags[i].textInput, tag:rawInputValidationTags[i])
            if(result == nil){
                print(i)
                print(rawInputTags[i].textInput)
                return i
            }
            else{
                //successful, get the validated resutls back
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
    
    //calls the computation engine
    //returns the computed metrics if succesful
    //returns nil if failed
    func compute() -> Bool{
        //calls the computation engine
        let result = computeMetrics(projectId:projectId, projectProgrammingLanguage: projectProgrammingLanguage, projectAvgAnnualSalary: projectAvgAnnualSalary,projectTeamSize: projectTeamSize,projectNcSloc: projectNcSloc, projectReqDesEffort: projectReqDesEffort, projectDevEffort: projectDevEffort, projectFindDefectEffort: projectFindDefectEffort,projectReworkEffort: projectReworkEffort,projectIssueCount: projectIssueCount,projectPostReleaseIndicator: projectPostReleaseIndicator)
        
        if(result == nil) {
            return false
        }
        var metrics = result!
        //sort the results for translation
        metrics = metrics.sorted {$0.0 < $1.0}
        
        //translate from the metrics the real dictionary
        dict = computeMetrics(metrics)
        dict["Project Name"] = projectName
        return true
    }
    
    
}


