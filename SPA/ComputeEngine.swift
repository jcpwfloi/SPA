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
            ans["Project Cost Effectiveness"] = (tuple.1, nil)
            
        case "OutputIndex04":
            ans["Development Process Effectiveness"] = (tuple.1, nil)
            
        case "OutputIndex04a":
            ans["Est Project Failure Risk"] = (tuple.1, nil)
            
        case "OutputIndex04b":
            ans["Est Project Delay Risk"] = (tuple.1, nil)
            
        case "OutputIndex04c":
            ans["Est Software Poor Quality Risk"] = (tuple.1, nil)
            
        case "OutputIndex4d":
            ans["Est Complete Early"] = (tuple.1, nil)
            
        case "OutputIndex4e":
            ans["Est Complete On-Time"] = (tuple.1, nil)
            
        case "OutputIndex4f":
            ans["Est Complete Delayed"] = (tuple.1, nil)
            
        case "OutputIndex4g":
            ans["Est Complete Canceled"] = (tuple.1, nil)
            
        case "OutputIndex4h":
            ans["Est Cost of Quality"] = (tuple.1, nil)
            
        case "OutputIndex4i":
            ans["Est Total Project Cost"] = (tuple.1, nil)
            
        case "OutputIndex4j":
            ans["Est Project Duration"] = (tuple.1, nil)
            
            
        case "OutputIndex05":
            print("*****************************", terminator: "")
            print("DERIVED-PROJECT INPUTS:      ", terminator: "")
            print("*****************************", terminator: "")
            print("ProjectId:", terminator: "")
            print("     \(tuple.2!)", terminator: "")
            
        case "OutputIndex06":
            ans["Project Team Size"] = (tuple.1, nil)
            
        case "OutputIndex07":
            ans["Labor Rate"] = (tuple.1, nil)
            
        case "OutputIndex08":
            ans["Total Project Hours"] = (tuple.1, nil)
            
        case "OutputIndex08a":
            ans["Development Effort Percent"] = (tuple.1, nil)
            
        case "OutputIndex08b":
            ans["Test Effort Percent"] = (tuple.1, nil)
            
        case "OutputIndex09":
            ans["Programming Language"] = (nil, tuple.2)
            
        case "OutputIndex09a":
            ans["Programming Language Level"] = (tuple.1, nil)
            
        case "OutputIndex10":
            ans["NumNcnbSloc"] = (tuple.1, nil)
            
        case "OutputIndex10a":
            ans["Number of Issues"] = (tuple.1, nil)
            
        case "OutputIndex10b":
            ans["Est Number of Severity 1 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10c":
            ans["Est Number of Severity 2 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10d":
            ans["Est Number of Severity 3 Issues"] = (tuple.1, nil)
            
        case "OutputIndex10e":
            ans["Est Number of Severity 4 Issues"] = (tuple.1, nil)
            
        case "OutputIndex11":
            ans["CMMI Maturity Level"] = (tuple.1, nil)
            
        case "OutputIndex12":
            ans["Programming Productivity"] = (tuple.1, nil)
            
        case "OutputIndex13":
            ans["Est PreRelease Defects"] = (tuple.1, nil)
            
        case "OutputIndex14":
            ans["Est PostRelease Defects"] = (tuple.1, nil)
            
        case "OutputIndex140a":
            ans["Est Expected Delivered Defects"] = (tuple.1, nil)
            
        case "OutputIndex14a":
            ans["Est PreRelease Requirements Defects"] = (tuple.1, nil)
            
        case "OutputIndex14b":
            ans["Est PreRelease Design Defects"] = (tuple.1, nil)
            
        case "OutputIndex14c":
            ans["Est PreRelease Code Defects"] = (tuple.1, nil)
            
        case "OutputIndex14d":
            ans["Est PreRelease Test Defects"] = (tuple.1, nil)
            
        case "OutputIndex14e":
            ans["Est PreRelease Documentation Defects"] = (tuple.1, nil)
            
        case "OutputIndex14f":
            ans["Est PreRelease Bad-Fix Defects"] = (tuple.1, nil)
            
        case "OutputIndex15":
            ans["Software Defect Density"] = (tuple.1, nil)
            
        case "OutputIndex15a":
            ans["Industry Average Defect Density"] = (tuple.1, nil)
            
        case "OutputIndex16":
            ans["PotentialDfsLeft"] = (tuple.1, nil)
            
        case "OutputIndex16a":
            ans["Est Requirement Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16b":
            ans["Est Design Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16c":
            ans["Est Code Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16d":
            ans["Est Security Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16e":
            ans["Est User Documentation Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16f":
            ans["Est Test Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex16g":
            ans["Est Bad-Fix Defects Left"] = (tuple.1, nil)
            
        case "OutputIndex17":
            ans["Est Defects per Engineering Month"] = (tuple.1, nil)
            
        case "OutputIndex18":
            ans["Est Software Inspection Productivity"] = (tuple.1, nil)
            
        case "OutputIndex19":
            ans["Est Quality Assurance Productivity"] = (tuple.1, nil)
            
        case "OutputIndex20":
            ans["Est Defects Leaked to Users"] = (tuple.1, nil)
            
        case "OutputIndex21":
            ans["Est Project Defect Removal Efficiency"] = (tuple.1, nil)
            
        case "OutputIndex22":
            ans["Est Capability-Based DRE"] = (nil, tuple.2)
            
        case "OutputIndex22a":
            ans["Est US Average DRE"] = (tuple.1, nil)
            
        case "OutputIndex22b":
            ans["Est US Average DDE"] = (tuple.1, nil)
            
        case "OutputIndex23":
            ans["Est Find Fix Effort Per Defect"] = (tuple.1, nil)
            
        case "OutputIndex24":
            ans["Est Avg Find Fix Effort per Defect"] = (tuple.1, nil)
            
        case "OutputIndex25":
            ans["Est Unit Cost per Engineering Month"] = (tuple.1, nil)
            
        case "OutputIndex28":
            ans["Est Find Fix Percentage"] = (tuple.1, nil)
            
        case "OutputIndex28a":
            ans["Est Project Effort"] = (tuple.1, nil)
            
        case "OutputIndex28b":
            ans["Est Requirements Effort"] = (tuple.1, nil)
            
        case "OutputIndex28c":
            ans["Est Design Effort"] = (tuple.1, nil)
            
        case "OutputIndex28d":
            ans["Est Code Effort"] = (tuple.1, nil)
            
        case "OutputIndex28e":
            ans["Est Test Effort"] = (tuple.1, nil)
            
        case "OutputIndex28f":
            ans["Est Total Project Staffing"] = (tuple.1, nil)
            
        case "OutputIndex28g":
            ans["Est Requirements Staffing"] = (tuple.1, nil)
            
        case "OutputIndex28h":
            ans["Est Design Staffing"] = (tuple.1, nil)
            
        case "OutputIndex28i":
            ans["Est Coding Staffing"] = (tuple.1, nil)
            
        case "OutputIndex28j":
            ans["Est Test Staffing"] = (tuple.1, nil)
            
        case "OutputIndex29":
            ans["Est Project Duration"] = (tuple.1, nil)
            
        case "OutputIndex29a":
            ans["Est Design, Code & Test Cost"] = (tuple.1, nil)
            
        case "OutputIndex29b":
            ans["Est Team Cost per Engineering Month"] = (tuple.1, nil)
            
        case "OutputIndex29c":
            ans["Est Cost of Quality"] = (tuple.1, nil)
            
        case "OutputIndex29d":
            ans["Est Technical Debt"] = (tuple.1, nil)
            
        case "OutputIndex30":
            ans["Est Total Development Cost"] = (tuple.1, nil)
            
        case "OutputIndex30a":
            ans["Est Lifetime Maintenance Cost"] = (tuple.1, nil)
            
        case "OutputIndex30b":
            ans["Est Total Project Cost"] = (tuple.1, nil)
            
        case "OutputIndex30c":
            ans["Est Agile Invested Savings"] = (tuple.1, nil)
            
        case "OutputIndex31":
            ans["Est Cost-Effectiveness Indicator"] = (tuple.1, nil)
            
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

