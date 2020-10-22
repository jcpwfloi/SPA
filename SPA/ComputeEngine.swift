//
//  ComputeEngine.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-21.
//

import Foundation

func computeMetrics(_ outputValues: [(String, Double?, String?)]) -> [String : (Double?, String?)] {
    
    var ans = [String: (Double?, String?)]()
    
    for tuple in outputValues {
        
        switch "\(tuple.0)" {
            
        case "OutputIndex00":
            ans["ProjectId"] = (nil, tuple.2)
            
        case "OutputIndex01":
            ans["Project Productivity"] = (tuple.1, nil)
            
        case "OutputIndex02":
            ans["Software Quality"] = (tuple.1, nil)
            
        case "OutputIndex03":
            ans["Project CostEffectiveness"] = (tuple.1, nil)
            
        case "OutputIndex04":
            ans["SoftwareProcessEffectiveness"] = (tuple.1, nil)
            
        case "OutputIndex04a":
            ans["EstProjectFailureRisk"] = (tuple.1, nil)
            
        case "OutputIndex04b":
            ans["EstProjectDelayRisk"] = (tuple.1, nil)
            
        case "OutputIndex04c":
            ans["EstSoftwarePoorQualityRisk"] = (tuple.1, nil)
            
        case "OutputIndex4d":
            ans["EstCompletionEarly"] = (tuple.1, nil)
            
        case "OutputIndex4e":
            ans["EstCompletionOntime"] = (tuple.1, nil)
            
        case "OutputIndex4f":
            ans["EstCompletionDelayed"] = (tuple.1, nil)
            
        case "OutputIndex4g":
            ans["EstCompletionCanceled"] = (tuple.1, nil)
            
        case "OutputIndex4h":
            ans["EstCostOfQuality"] = (tuple.1, nil)
            
        case "OutputIndex4i":
            ans["EstTotalProjectCost"] = (tuple.1, nil)
            
        case "OutputIndex4j":
            ans["EstProjectDuration"] = (tuple.1, nil)
            
            
        case "OutputIndex05":
            print("*****************************", terminator: "")
            print("DERIVED-PROJECT INPUTS:      ", terminator: "")
            print("*****************************", terminator: "")
            print("ProjectId:", terminator: "")
            print("     \(tuple.2!)", terminator: "")
            
        case "OutputIndex06":
            ans["ProjectTeamSize"] = (tuple.1, nil)
            
        case "OutputIndex07":
            ans["LaborRate"] = (tuple.1, nil)
            
        case "OutputIndex08":
            ans["TotalProjectHours"] = (tuple.1, nil)
            
        case "OutputIndex08a":
            ans["DevEffortPercent"] = (tuple.1, nil)
            
        case "OutputIndex08b":
            ans["TestEffortPercent"] = (tuple.1, nil)
            
        case "OutputIndex09":
            ans["ProgrammingLanguage"] = (nil, tuple.2)
            
        case "OutputIndex09a":
            ans["ProgLanguageLevel"] = (tuple.1, nil)
            
        case "OutputIndex10":
            ans["NcSloc"] = (tuple.1, nil)
            
        case "OutputIndex10a":
            ans["NumIssues"] = (tuple.1, nil)
            
        case "OutputIndex10b":
            ans["EstNumSeverity 1 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10c":
            ans["EstNumSeverity 2 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10d":
            ans["EstNumSeverity 3 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10e":
            ans["EstNumSeverity 4 Issues"] = (tuple.1, nil)
            
        case "OutputIndex11":
            print("*****************************", terminator: "")
            print("PROJECT PROFILE:", terminator: "")
            print("*****************************", terminator: "")
            print("EstCmmiLevel:", terminator: "")
            print("     \(tuple.1!)", terminator: "")
            ans["EstCmmiLevel"] = (tuple.1, nil)
            
        case "OutputIndex12":
            ans["ProgrammingProductivity"] = (tuple.1, nil)
            
        case "OutputIndex13":
            ans["EstPreReleaseDefects"] = (tuple.1, nil)
            
        case "OutputIndex14":
            ans["EstPostReleaseDefects"] = (tuple.1, nil)
            
        case "OutputIndex140a":
            ans["EstExpectedDeliveredDfs"] = (tuple.1, nil)
            
        case "OutputIndex14a":
            ans["EstPreReleaseRequirementsDfs"] = (tuple.1, nil)
            
        case "OutputIndex14b":
            ans["EstPreReleaseDesignDfs"] = (tuple.1, nil)
            
        case "OutputIndex14c":
            ans["EstPreReleaseCodeDfs"] = (tuple.1, nil)
            
        case "OutputIndex14d":
            ans["EstPreReleaseTestDfs"] = (tuple.1, nil)
            
        case "OutputIndex14e":
            ans["EstPreReleaseUserDocDfs"] = (tuple.1, nil)
            
        case "OutputIndex14f":
            ans["EstPreReleaseBadfixDfs"] = (tuple.1, nil)
            
        case "OutputIndex15":
            ans["Software Defect Density"] = (tuple.1, nil)
            
        case "OutputIndex15a":
            ans["Industry Average Defect Density"] = (tuple.1, nil)
            
        case "OutputIndex16":
            ans["PotentialDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16a":
            ans["EstRequirementsDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16b":
            ans["EstDesignDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16c":
            ans["EstCodeDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16d":
            ans["EstSecurityDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16e":
            ans["EstUserDocDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16f":
            ans["EstTestDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16g":
            ans["EstBadfixDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex17":
            ans["DefectsPerEm"] = (tuple.1, nil)
            
        case "OutputIndex18":
            ans["SIProductivity"] = (tuple.1, nil)
            
        case "OutputIndex19":
            ans["QAProductivity"] = (tuple.1, nil)
            
        case "OutputIndex20":
            ans["DefectsLeakedToUsers"] = (tuple.1, nil)
            
        case "OutputIndex21":
            ans["ProjectDRE"] = (tuple.1, nil)
            
        case "OutputIndex22":
            ans["CapabilityBasedDRE"] = (nil, tuple.2)
            
        case "OutputIndex22a":
            ans["USAverageDRE"] = (tuple.1, nil)
            
        case "OutputIndex22b":
            ans["USAverageDDE"] = (tuple.1, nil)
            
        case "OutputIndex23":
            ans["FindFixEffortPerDefect"] = (tuple.1, nil)
            
        case "OutputIndex24":
            ans["EstAvgFindFixEffPerDf"] = (tuple.1, nil)
            
        case "OutputIndex25":
            ans["ProgUnitCostPerEm"] = (tuple.1, nil)
            
        case "OutputIndex28":
            ans["FindFixPercentage"] = (tuple.1, nil)
            
        case "OutputIndex28a":
            ans["EstProjectffort"] = (tuple.1, nil)
            
        case "OutputIndex28b":
            ans["EstRequirementsEffort"] = (tuple.1, nil)
            
        case "OutputIndex28c":
            ans["EstDesignEffort"] = (tuple.1, nil)
            
        case "OutputIndex28d":
            ans["EstCodeEffort"] = (tuple.1, nil)
            
        case "OutputIndex28e":
            ans["EstTestEffort"] = (tuple.1, nil)
            
        case "OutputIndex28f":
            ans["EstProjectStaffing"] = (tuple.1, nil)
            
        case "OutputIndex28g":
            ans["EstRequirementsStaffing"] = (tuple.1, nil)
            
        case "OutputIndex28h":
            ans["EstDesignStaffing"] = (tuple.1, nil)
            
        case "OutputIndex28i":
            ans["EstCodeStaffing"] = (tuple.1, nil)
            
        case "OutputIndex28j":
            ans["EstTestStaffing"] = (tuple.1, nil)
            
        case "OutputIndex29":
            ans["EstProjDurationInEms"] = (tuple.1, nil)
            
        case "OutputIndex29a":
            ans["EstDCUTCost"] = (tuple.1, nil)
            
        case "OutputIndex29b":
            ans["EstTeamCostPerEm"] = (tuple.1, nil)
            
        case "OutputIndex29c":
            ans["EstCostOfQuality"] = (tuple.1, nil)
            
        case "OutputIndex29d":
            ans["EstTechnicalDebt"] = (tuple.1, nil)
            
        case "OutputIndex30":
            ans["EstTotalDevelopmentCost"] = (tuple.1, nil)
            
        case "OutputIndex30a":
            ans["EstLifetimeMaintCost"] = (tuple.1, nil)
            
        case "OutputIndex30b":
            ans["EstTotalProjectCost"] = (tuple.1, nil)
            
        case "OutputIndex30c":
            ans["EstAgileInvestedSavings"] = (tuple.1, nil)
            
        case "OutputIndex31":
            ans["CostEffectivenessInd"] = (tuple.1, nil)
            
        default:
            print("Invalid Output Index", terminator: "")
            
        } // end switch
        
    } // end for-in
    
    return ans
}

func computeMetricsString(_ outputValues: [(String, Double?, String?)]) -> [String : String] {
    let ans = computeMetrics(outputValues)
    
    var ret = [String : String] ()
    
    for (key, value) in ans {
        if value.0 == nil {
            ret[key] = value.1!
        } else {
            ret[key] = String(format: "%f", value.0!)
        }
    }
    
    return ret
}

