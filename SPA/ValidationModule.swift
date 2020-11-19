//
//  ValidationModule.swift
//  SPA
//
//  Created by Jingyuan Chen on 11/5/20.
//

import Foundation


let projectNameValidationTag = 1
let programmingLanguageValidationTag = 2
let inputAvgAnnualSalaryValidationTag = 3
let teamSizeValidationTag = 4;
let ncSlocValidationTag = 5
let reqDesEffortValidationTag = 6
let devEffortValidationTag = 7
let findDefectEffortValidationTag = 8
let reworkEffortValidationTag = 9
let issueCountValidationTag = 10
let postReleaseIndicatorTag = 11


extension String {
    
}


//+
// Validate Input Parameters
//-

func validateInputParameter(_ input: String?, tag: Int) -> (Double?, String?)? {
    
    var inputDouble: Double = 0.0
    var inputString = "the input parameter if not nil"
    
    //+
    // Check for a nil input
    //-
    
    if let input = input {
        inputString = input
    } else {
        return nil
    }
    
    //+
    // Treat empty string like a nil
    //-
    
    if inputString == "" {
        return nil
    }
    
    //+
    // Make sure input begins with a letter or a digit
    //-
    
    var alphabeticRecognized = false
    
    switch inputString[inputString.startIndex] {
        
    case "A", "B", "C", "D", "E", "F", "G", "H", "I":
        alphabeticRecognized = true
        
    case "J", "K", "L", "M", "N", "O", "P", "Q", "R":
        alphabeticRecognized = true
        
    case "S", "T", "U", "V", "W", "X", "Y", "Z":
        alphabeticRecognized = true
        
    case "a", "b", "c", "d", "e", "f", "g", "h", "i":
        alphabeticRecognized = true
        
    case "j", "k", "l", "m", "n", "o", "p", "q", "r":
        alphabeticRecognized = true
        
    case "s", "t", "u", "v", "w", "x", "y", "z":
        alphabeticRecognized = true
        
    default:
        break
    }
    
    if !alphabeticRecognized {
        switch inputString[inputString.startIndex] {
            
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            if let inputDoubleValue = inputString.toDouble() {
                inputDouble = inputDoubleValue
                break
            } else {
                return nil
            }
            
        default:
            return nil
        }
    }
    
    
    //+
    // Validate Each Different Instance of Input String
    //-
    
    switch tag {
        
    case projectNameValidationTag:                        // Project Name Input Parameter Validation
        
        if let validatedProjectName = validateProjectNameParameter(inputString) {
            return (nil, validatedProjectName)
        } else {
            return nil
        }
        
    case programmingLanguageValidationTag:                // Programming Language Input Parameter Validation
        
        if let validatedProgrammingLanguage = validateProgrammingLanguageParameter(inputString) {
            return (nil, validatedProgrammingLanguage)
        } else {
            return nil
        }
        
    case inputAvgAnnualSalaryValidationTag:                // Average Annual Salary Input Parameter Validation
        
        if let validatedInputAvgAnnualSalary = validateInputAvgAnnualSalaryParameter(inputDouble) {
            return (validatedInputAvgAnnualSalary, nil)
        } else {
            return nil
        }
        
    case teamSizeValidationTag:                            // Team Size Input Parameter Input Parameter Validation
        
        if let validatedTeamSize = validateTeamSizeParameter(inputDouble) {
            return (validatedTeamSize, nil)
        } else {
            return nil
        }
        
    case ncSlocValidationTag:                               // # of NCSLOC Input Parameter Validation
        
        if let validatedNcSloc = validateNcSlocParameter(inputDouble) {
            return (validatedNcSloc, nil)
        } else {
            return nil
        }
        
    case reqDesEffortValidationTag:                         // Requirements & Design Effort Input Parameter Validation
        
        if let validatedReqDesEffort = validatedReqDesEffortParameter(inputDouble) {
            return (validatedReqDesEffort, nil)
        } else {
            return nil
        }
        
    case devEffortValidationTag:                            // Programming & QA Development Effort Input Parameter Validation
        
        if let validatedDevEffort = validateDevEffortParameter(inputDouble) {
            return (validatedDevEffort, nil)
        } else {
            return nil
        }
        
    case findDefectEffortValidationTag:                     // Find Defect Effort Input Parameter Validation
        
        if let validatedFindDefectEffort = validateFindDefectEffortParameter(inputDouble) {
            return (validatedFindDefectEffort, nil)
        } else {
            return nil
        }
    case reworkEffortValidationTag:                         // Rework Effort Inputer Parmaeter Validation
        
        if let validatedReworkEffort = validateReworkEffortParameter(inputDouble) {
            return (validatedReworkEffort, nil)
        } else {
            return nil
        }
        
    case issueCountValidationTag:                           // Critical and Major Issue Count Input Parameter Validation
        
        if let validatedIssueCount = validateIssueCountParameter(inputDouble) {
            return (validatedIssueCount, nil)
        } else {
            return nil
        }
    case postReleaseIndicatorTag:                           // Post Release Indicator Input Parameter Validation
        
        if let validatedPostReleaseIndicator = validatePostReleaseIndicatorParameter(inputString) {
            return (nil, validatedPostReleaseIndicator)
        } else {
            return nil
        }
        
    default:
        return nil
    } // end switch
    
} // end validateInputParameter


//+
// Validate Project Name Input Parameter
//-

func validateProjectNameParameter(_ projectName: String) -> String? {
    
    let maximumKProjectNameGliphCount = 25
    
    var projectNameGliphCount = 0
    
    for projectNameIndex in projectName.indices {
        projectNameGliphCount += 1
        
        if projectNameGliphCount == 1 {
            
            switch "\(projectName[projectName.startIndex])" {
            case "A", "B", "C", "D", "E", "F", "G", "H", "I":
                continue
                
            case "J", "K", "L", "M", "N", "O", "P", "Q", "R":
                continue
                
            case "S", "T", "U", "V", "W", "X", "Y", "Z":
                continue
                
            case "a", "b", "c", "d", "e", "f", "g", "h", "i":
                continue
                
            case "j", "k", "l", "m", "n", "o", "p", "q", "r":
                continue
                
            case "s", "t", "u", "v", "w", "x", "y", "z":
                continue
                
            default:
                return nil
            }
            
        } else {
            switch "\(projectName[projectNameIndex])" {
            case "A", "B", "C", "D", "E", "F", "G", "H", "I":
                continue
                
            case "J", "K", "L", "M", "N", "O", "P", "Q", "R":
                continue
                
            case "S", "T", "U", "V", "W", "X", "Y", "Z":
                continue
                
            case "a", "b", "c", "d", "e", "f", "g", "h", "i":
                continue
                
            case "j", "k", "l", "m", "n", "o", "p", "q", "r":
                continue
                
            case "s", "t", "u", "v", "w", "x", "y", "z":
                continue
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "_", "-", " ":
                continue
                
            default:
                return nil
                
            }
        }
    }
    
    if projectNameGliphCount > maximumKProjectNameGliphCount {
        return nil
    }
    return projectName
} // end validateProjectNameParameter


//+
// Validate Programming Language Input Parameter
//-

func validateProgrammingLanguageParameter(_ programmingLanguage: String) -> String? {
    
    let maximumProgrammingLanguageGliphCount = 12
    
    var programmingLanguageGliphCount = 0;
    for programmingLanguageIndex in programmingLanguage.indices {
        
        programmingLanguageGliphCount += 1
        if programmingLanguageGliphCount == 1 {
            
            switch "\(programmingLanguage[programmingLanguage.startIndex])" {
                
            case "A", "B", "C", "D", "E", "F", "G", "H", "I":
                continue
                
            case "J", "K", "L", "M", "N", "O", "P", "Q", "R":
                continue
                
            case "S", "T", "U", "V", "W", "X", "Y", "Z":
                continue
                
            case "a", "b", "c", "d", "e", "f", "g", "h", "i":
                continue
                
            case "j", "k", "l", "m", "n", "o", "p", "q", "r":
                continue
                
            case "s", "t", "u", "v", "w", "x", "y", "z":
                continue
                
            default:
                return nil
            }
            
        } else {
            switch "\(programmingLanguage[programmingLanguageIndex])" {
                
            case "A", "B", "C", "D", "E", "F", "G", "H", "I":
                continue
                
            case "J", "K", "L", "M", "N", "O", "P", "Q", "R":
                continue
                
            case "S", "T", "U", "V", "W", "X", "Y", "Z":
                continue
                
            case "a", "b", "c", "d", "e", "f", "g", "h", "i":
                continue
                
            case "j", "k", "l", "m", "n", "o", "p", "q", "r":
                continue
                
            case "s", "t", "u", "v", "w", "x", "y", "z":
                continue
                
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "+", "/", "#":
                continue
                
            default:
                return nil
                
            }
        }
    }
    
    if programmingLanguageGliphCount > maximumProgrammingLanguageGliphCount {
        return nil
    }
    
    return programmingLanguage
    
} // end validateProgrammingLanguageParameter


//+
// Validate Average Annual Salary Input Parameter
//-

func validateInputAvgAnnualSalaryParameter(_ inputAvgAnnualSalary: Double) -> Double? {
    
//    print("\(inputAvgAnnualSalary)", terminator: "")
    
    let minimumInputAvgAnnualSalary = 50000.00
    let maximumInputAvgSalary = 200000.00
    
    if inputAvgAnnualSalary < minimumInputAvgAnnualSalary || inputAvgAnnualSalary > maximumInputAvgSalary {
        return nil
    }
    
    return inputAvgAnnualSalary
    
} // end validateInputAvgAnnualSalaryParaameter


//+
// Validate Input Team Size Input Parameter
//-

func validateTeamSizeParameter(_ teamSize: Double) -> Double? {
    
    let minimumTeamSize = 1.0
    let maximumTeamSize = 2000.0
    
    if teamSize < minimumTeamSize || teamSize > maximumTeamSize {
        return nil
        
    }
    
    return teamSize
    
} // end validateTeamSizeParameter


//+
// Validate # of NCSLOC Input Parameter
//-

func validateNcSlocParameter(_ ncSloc: Double) -> Double? {
    
    let minimumNcSloc = 3000.0
    let maximumNcSloc = 100000000.0
    
    if ncSloc < minimumNcSloc || ncSloc > maximumNcSloc {
        return nil
    }
    
    return ncSloc
    
} // end validateNcSlocParameter


//+
// Validate Requirements & Design Effort Input Parameter
//-

func validatedReqDesEffortParameter(_ reqDesEffort: Double) -> Double? {
    
    let minimumReqDesEffort = 1.0
    let maximumReqDesEffort = 2000000.0
    
    if reqDesEffort < minimumReqDesEffort || reqDesEffort > maximumReqDesEffort {
        return nil
    }
    
    return reqDesEffort
    
} // end ValidatedReqDesParameter

//+
// Validate Development & QA Effort Input Parameter
//-

func validateDevEffortParameter(_ devEffort: Double) -> Double? {
    
    let minimumDevEffort = 1.0
    let maximumDevEffort = 2000000.0
    
    if devEffort < minimumDevEffort || devEffort > maximumDevEffort {
        return nil
    }
    
    return devEffort
    
} // end validateDevEffortParameter


//+
// Validate Find Defect Effort Input Parameter
//-

func validateFindDefectEffortParameter(_ findDefectEffort: Double) -> Double? {
    
    let minimumFindDefectEffort = 1.0
    let maximumFindDefectEffort = 2000000.0
    
    if findDefectEffort < minimumFindDefectEffort || findDefectEffort > maximumFindDefectEffort {
        return nil
    }
    
    return findDefectEffort
    
} // end validateFindDefectEffortParameter


//+
// Validate Rework Effort Input Parameter
//-

func validateReworkEffortParameter(_ reworkEffort: Double) -> Double? {
    
    let minimumReworkEffort = 1.0
    let maximumReworkEffort = 2000000.0
    
    if reworkEffort < minimumReworkEffort || reworkEffort > maximumReworkEffort {
        return nil
    }
    
    return reworkEffort
    
} // end validateReworkEffortParameter


//+
// Validate Issue Count Input Parameter
//-

func validateIssueCountParameter(_ issueCount: Double) -> Double? {
    
    let minimumIssueCount = 1.0
    let maximumIssueCount = 100000.0
    
    if issueCount < minimumIssueCount || issueCount > maximumIssueCount {
        return nil
    }
    
    return issueCount
    
} // end validIssueCountParameter


//+
// Validate Post Release Indicator Input Parameter
//-

func validatePostReleaseIndicatorParameter(_ postReleaseIndicator: String) -> String? {
    
    if postReleaseIndicator != upCaseY && postReleaseIndicator != lowerCaseY && postReleaseIndicator != upCaseN && postReleaseIndicator != lowerCaseN {
        return nil
    }
    
    return postReleaseIndicator
    
} // end validatePostReleaseIndicatorParameter

