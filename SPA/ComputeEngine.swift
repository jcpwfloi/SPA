//
//  ComputeEngine.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-21.
//

import Foundation



let industryAverageAnnualSalary = 109953.0      // Source:  www.indeed.com, as of 08/19/2020,
                                                //          for Average Software Engineer salary including $4K bonus

//+
// Named Constant for 1000
//-

let k1000 = 1000.0                      // 1000 as a decimal number

//+
// Number of Hours in an Engineering Month
//-

let hoursPerMonth = 160.00               // # of Hours per Engineering Month (EM)

//+
// Number of Hours in an Engineering Year
//-

let hoursPerYear = 2080.00              // # of Hour per Engineering Year (EY), including Stanadard Two-Weeks Vacation


//+
// CMMI Maturity Level Encodings:
//
//    Source 1:  CMMI Institute (www.cmmiinstitute.com), "CMMI for Development, Version 1.3", 2010.
//
//    Source 2:  M.C Paulk, et al, "The Capability Maturity Model:  Guidelines for Improving the Software Process",
//                                      Addison-Wesley, 1994.
//
//    Source 3:  R.B. Grady, "Practical Software Metrics for Project Management and Process Improvement", pp. 4-6,
//                                Prentice-Hall, 1992.
//-

let cmmiMaturityLevel1 = 1.0            // CMMI Maturity Level 1 Encoding:  "Performed"
let cmmiMaturityLevel2 = 2.0            // CMMI Maturity Level 1 Encoding:  "Managed"
let cmmiMaturityLevel3 = 3.0            // CMMI Maturity Level 3 Encoding:  "Defined"
let cmmiMaturityLevel4 = 4.0            // CMMI Maturity Level 4 Encoding:  "Quantitatively Managed"
let cmmiMaturityLevel5 = 5.0            // CMMI Maturity Level 5 Encoding:  "Optimizing"


//+
// Estimated Average Find and Fix Effort per Defect in Hours:
//
//  Source 1:  W. Humphrey, "Managing the Software Process, p. 12, Addison-Wesley, 1989.
//  Source 2:  R. Grady, "Software Metrics:  Establishing a Company-Wide Program", p. 128, Prentice-Hall, 1987.
//  Source 3:  R. Blair, Spreadsheet data, based on the book:  C. Jones, "Software Methodologies:  A Quantitative Guide",
//                                                                             CRC Press, 2017.
//  Source 4:  R. Blair, final, adopted average, based on software engineering experience, taking above conflicting data
//                                  sources into consideration.
//-

let estAvgFindFixEffortPerDefect = 10.0


//+
// Average Potential Defects per Function Point:
//
//    Source:  C. Jones, "Software Methodologies:  A Quantitative Guide", p. xxvi, CRC Press, 2018.
//-

let avgPotentialDefectsPerFP = 4.25


//+
// Mapping Between Programming Languages & (1) Backfired NcSloc per FP, (2) Language Level, (3) Defects per KNcSloc and
//                                         (4) Work Hours per FP
//
//  Source 1:  C. Jones, Private Communication:  "Example 6:  How Software Risk Master (SRM) Evaluates Programming Languages",
//                                                2017.
//  Source 2:  L. Putnam, Quantitative Software Management, http://www.qsm.com/resources/function-point-languages-table, 2017.
//  Source 3:  C. Jones, "Quantifying Software:  Global and Industry Perspectives", Table 1.22, pp. 50-53, CRC Press, 2018.
//  Source 4:  C. Jones, Private Communication:  "Software Development Quality Expressed in Defects per Function Point and
//                                                Defects per KLOC", 2014.
//  Source 5:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 8.1, pp. 64-67, CRC Press, 2017.
//-

let programmingLanguagesTable = ["ABAP", "APL", "ASP", "ASP.NET", "Ada95", "Algol", "BAL", "Basic",
                                 "Bliss", "Brio", "C", "C#", "C# + HTML", "C++", "CICS", "COBOL",
                                 "COBOL + SQL", "CSP", "DB2", "Delphi", "ESPL/I", "Excel", "FORTRAN", "Go",
                                 "HTML", "HTML5", "IBM ADF", "IBM Cognos", "J2EE", "JCL", "Java",
                                 "Java + HTML", "JavaScript", "Jovial", "Lisp", "Macro Assembly", "Modula", "Objective C", "Objective C + HTML", "Oracle",
                                 "PHP", "PHP + SQL", "PL/I", "PL/S", "PL/SQL", "Pascal", "Perl", "Powerbuilder",
                                 "Prolog", "Python", "Python + HTML", "QBE", "R", "RPG III", "Ruby", "SQL", "Shell Scripts",
                                 "Simula", "SmallTalk", "Swift", "Swift + HTML", "VB.NET", "Visual Basic", "XML"]

let backFireNcSlocPerFpTable = [80.0, 32.00, 16.84, 24.62, 49.23, 106.67, 320.00, 64.00,
                                106.67, 14.00, 128.00, 51.20, 51.20, 53.33, 45.71, 106.67,
                                106.67, 18.00, 40.00, 29.09, 71.11, 6.40, 106.67, 53.33,
                                160.0, 160.0, 20.00, 42.00, 49.00, 220.69, 53.33,
                                53.33, 71.11, 106.67, 64.00, 35.00, 80.00, 26.67, 26.67, 40.00,
                                53.33, 53.33, 80.00, 91.43, 35.00, 91.43, 35.56, 28.00,
                                64.00, 53.33, 53.33, 12.80, 40.00, 47.41, 45.71, 12.80, 64.00,
                                45.71, 21.33, 26.67, 26.67, 60.00, 26.67, 128.0]

let backFiredLanguageLevelTable = [4.0, 10.0, 18.8, 13.0, 6.5, 3.0, 1.0, 5.0,
                                   3.0, 22.6, 2.5, 6.3, 4.2, 6.0, 7.0, 3.0,
                                   14.0, 17.3, 8.0, 11.0, 4.5, 50.0, 3.0, 6.0,
                                   2.0, 2.0, 16.0, 7.6, 6.5, 1.5, 6.0,
                                   4.0, 4.5, 3.0, 5.0, 1.5, 4.0, 12.0, 7.0, 8.0,
                                   6.0, 15.5, 4.0, 3.5, 9.1, 3.5, 9.0, 11.3,
                                   5.0, 6.0, 4.0, 25.0, 8.0, 6.8, 7.0, 25.0, 5.0,
                                   7.0, 15.0, 12.0, 7.0, 5.2, 11.9, 2.5]


let backFireDefectsPerKNcSlocTable = [6.27, 4.84, 5.14, 5.14, 6.13, 6.10, 4.23, 6.70,
                                      6.02, 5.67, 5.70, 6.21, 5.70, 6.63, 5.81, 5.87,
                                      5.87, 6.18, 5.54, 5.04, 6.45, 6.46, 5.71, 6.51,
                                      5.62, 5.20, 5.36, 5.25, 5.28, 4.69, 6.39,
                                      5.80, 6.35, 5.63, 6.38, 4.70, 6.18, 5.21, 5.21, 5.25,
                                      6.27, 5.97, 6.09, 5.88, 4.62, 5.97, 4.62, 5.04,
                                      6.28, 6.15, 5.68, 5.29, 5.54, 5.79, 5.41, 5.67, 6.17,
                                      5.28, 5.31, 5.21, 5.21, 6.27, 5.01, 6.35]

let backFireWorkHoursPerFpTable = [17.55, 8.82, 6.06, 7.48, 11.95, 22.39, 61.18, 14.64,
                                   22.39, 5.33, 26.27, 12.31, 24.70, 12.70, 11.31, 22.39,
                                   13.86, 5.33, 10.27, 8.29, 15.93, 4.16, 22.39, 12.70,
                                   32.09, 32.09, 6.64, 11.31, 11.95, 43.13, 12.70,
                                   22.40, 15.93, 22.39, 14.64, 41.79, 17.55, 7.85, 19.97, 10.27,
                                   12.70, 17.55, 9.02, 19.62, 9.46, 19.62, 9.46, 8.29,
                                   14.64, 12.70, 22.40, 5.33, 4.29, 11.62, 11.31, 5.33, 14.64,
                                   11.31, 6.88, 7.85, 19.97, 7.85, 7.85, 26.27]


//+
// Yes or No Responses to Questions of That Nature
//-

let upCaseY = "Y"                       // Upcase 'Y' response
let lowerCaseY = "y"                    // Lowercase 'y' response
let upCaseN = "N"                       // Upcase 'N' response
let lowerCaseN = "n"                    // Lowercase 'n' response

func computeMetrics() -> [(String, Double?, String?)]? {
    
    //+
    // Computed metric values
    //-
    
    var totalProjectEffort = 0.0                    // Total Project Effort in Hours
    var devEffortPercent = 0.0                        // Development Effort Percent
    var testEffortPercent = 0.0                        // Test Effort Percent
    var avgBurdenedLaborRate = 0.00                 // Average Burdened Labor Rate per Hour
    var ncSlocPerFp = 0.0                           // Backfired Number of Non-Comment, Non-Blank Source Lines of Code per Function Point
    var numDefectsPerKNcSloc = 0.0                  // Backfired Number of Defects per KNcSloc
    var numWorkHoursPerFp = 0.0                     // Backfired Number of Work Hours per Function Point
    var numFp = 0.0                                 // Number of Function Points
    var programmingProductivity = 0.0               // Programming Productivity in NCSLOC per EM
    var programmingLanguageLevel = 0.0              // Programming Language Level
    var defectDensity = 0.0                         // Defect Density
    var qualityIndex = 0.0                          // Quality Index
    var numSeverity1Defects = 0.0                   // # of Severity 1 Defects
    var numSeverity2Defects = 0.0                   // # of Severity 2 Defects
    var numSeverity3Defects = 0.0                   // # of Severity 3 Defects
    var numSeverity4Defects = 0.0                   // # of Severity 4 Defects
    var numPotentialDefectsLeft = 0.0               // # of Potential Defects Left
    var reqDefectsLeft = 0.0                        // # of Requirements Defects Left
    var desDefectsLeft = 0.0                        // # of Design Defects Left
    var codeDefectsLeft = 0.0                       // # of Code Defects Left
    var securityDefectsLeft = 0.0                   // # of Security Defects Left
    var docDefectsLeft = 0.0                        // # of Document Defects Left
    var testDefectsLeft = 0.0                       // # of Test Defects Left
    var badfixDefectsLeft = 0.0                     // # of Bad Fix Defects Left
    var numInjectedDefectsPerEm = 0.0               // # of Injected Defects per Engineering Month
    var cmmiMaturityLevelByProductivity = 0.0       // Estimated CMMI Maturity Level by Productivity
    var cmmiMaturityLevelByDefectsPerFp = 0.0       // Estimated CMMI Maturity Level by Defects per Function Point
    var finalCmmiMaturityLevel = 0.0                // Final Estimated CMMI Maturity Level
    var dd = 0.0                                    // Defects Detected by Development Using Software Inspections per Engineering Month
    var dl = 0.0                                    // Defects Leaked by Development to QA Testing per Engineering Month
    var qd = 0.0                                    // Defects Detected by QA Using Testing per Engineering Month
    var ql = 0.0                                    // Defects Leaked by QA not Caught Using Testing per Engineering Month
    var defectRemovalEffectiveness = 0.0            // Defect Removal Effectiveness (DRE)
    var usaAverageDRE = 0.0                         // USA Average DRE
    var usaAverageDDE = 0.0                         // USA Average DDE
    var findAndFixEffortPerDefect = 0.0             // Find and Fix Effort per Defect
    var programmingUnitCostPerEm = 0.0              // Programming Unit Cost per Engineering Month
    var teamCostPerEm = 0.0                         // Project Team Cost per Engineering Month
    var numDefectsLeakedToUsers = 0.0               // # of Defects Leaked to Users
    var projectDurationInMonths = 0.0               // Project Duration In Months
    var totalDCUTCost = 0.0                         // Total Design Code Unit Test (DCUT) Cost
    var totalDevelopmentCost = 0.0                  // Total Development Cost
    var lifetimeMaintenanceCost = 0.0               // Lifetime Maintenance Cost
    var totalProjectCost = 0.0                      // Total Project Cost
    var findFixPercent = 0.0                        // Find and Fix Percentage of Total Project Cost
    var findFixCostDueToDefects = 0.0               // Find and Fix Cost Due to Defects
    var technicalDebt = 0.0                         // Technical Debt
    var numPreReleaseDefects = 0.0                  // # of Pre-Release Defects
    var numPostReleaseDefects = 0.0                 // # of Post-Release Defects
    var numPreReleaseRequirementsDefects = 0.0      // # of PreRelease Requirements Defects
    var numPreReleaseDesignDefects = 0.0            // # of PreRelease Design Defects
    var numPreReleaseCodeDefects = 0.0              // # of PreRelease Code Defects
    var numPreReleaseTestDefects = 0.0              // # of PreRelease Test Defects
    var numPreReleaseUserDocDefects = 0.0           // # of PreRelase User Documentation Defects
    var numPreReleaseBadFixDefects = 0.0            // # of PreRelease Bad Fix Defects
    var costEffectivenessIndicator = 0.0            // Cost Effectiveness Indicator
    var executiveDashboardProductivity = 1.0        // Executive Dashboard Productivity
    var executiveDashboardQuality = 1.0             // Executive Dashboard Quality
    var executiveDashboardCostEffectiveness = 1.0   // Executive Dashboard Cost-Effectiveness
    var executiveDashboardSoftwareProcessEffectiveness = 1.0 // Executive Dashboard Sotware Process Effectiveness
    var projectFailureRisk = 0.0                    // Project Failure Risk Factor
    var projectDelayRisk = 0.0                      // Project Delay Risk Factor
    var projectPoorQualityRisk = 0.0                // Project Poor Quality Risk Factor
    var projectOutcomeEarly = 0.0                   // Project Outcome Early Percentage
    var projectOutcomeOntime = 0.0                  // Project Outcome Ontime Percentage
    var projectOutcomeDelayed = 0.0                 // Project Outcome Delayed Percentage
    var projectOutcomeCanceled = 0.0                // Project Outcome Canceled Percentage
    var roa = 0.0                                   // Estimated Agile Invested Cost Savings (Real Options Value)
    var expectedDeliveredDefects:  Double? = 0.0    // ExpectedDelivered Defects
    var projectEffort = 0.0                         // Project Effort in Staff Engineering Months (Staff-Em)
    var requirementsEffort = 0.0                    // Requirements Effort in Staff Engineering Months (Staff-Em)
    var designEffort = 0.0                          // Design Effort in Staff Engineering Months (Staff-Em)
    var codeEffort = 0.0                            // Code Effort in Staff Engineering Months (Staff-Em)
    var testEffort = 0.0                            // Test Effort in Staff Engineering Months (staff-Em)
    var projectStaffing = 0.0                       // Project Staffing
    var requirementsPhaseStaffing = 0.0             // Requirements Phase Staffing
    var designPhaseStaffing = 0.0                   // Design Phase Staffing
    var codePhaseStaffing = 0.0                     // Code Phase Staffing
    var testPhaseStaffing = 0.0                     // Test Phase Staffing
    
    //+
    // Hack to be able to compute Lifetime Maintenance Cost for Executive Summary
    //-
    
    let maintenanceCostPercent = 0.40               // Maintenance Cost Percent
    //     Source:  F.P. Brooks Jr, "Mythical Man-Month - Anniverary Edition", p. 121,
    //              Addison-Wesley, 1995.
    
    //+
    // Index into metric returned array of dictionary entries
    //-
    
    var metricIndex = 0;
    
  
    func computeTotalProjectEffort(_ reqDesEffort: Double, devEffort: Double, findDefectEffort: Double, reworkEffort: Double)
            -> (Double, Double, Double) {
        
        let developmentEffort = reqDesEffort + devEffort
        let testEffort = findDefectEffort + reworkEffort
        let totalDevelopmentEffort = developmentEffort + testEffort
        let developmentEffortPercent = floorOrCeiling((developmentEffort / totalDevelopmentEffort) * 100.0)
        let testEffortPercent = floorOrCeiling((testEffort / totalDevelopmentEffort) * 100.0)
        return (totalDevelopmentEffort, developmentEffortPercent, testEffortPercent)
        
    } // end computeTotalProjectEffort
    
    
    func computeBackfiredNcSlocPerFp(_ programmingLanguage: String) -> (ncSlocPerFp: Double, languageLevel: Double, numDefectsPerKNcSloc: Double, numWorkHoursPerFp: Double) {
        
        var defaultProgrammingLanguage = "Java"
        var languageLevel = 0.0
        var ncSlocPerFp = 0.0
        var numDefectsPerKNcSloc = 0.0
        var numWorkHoursPerFp = 0.0
        
        //+
        // Scan programming language table for hit on programming language and return backfired NcSloc per FP and
        //      DefectsPerKNcSloc including programming language level.
        //-
        
        for i in 0 ..< programmingLanguagesTable.count {
            
            if programmingLanguage == programmingLanguagesTable[i] {
                ncSlocPerFp = backFireNcSlocPerFpTable[i]
                languageLevel = backFiredLanguageLevelTable[i]
                numDefectsPerKNcSloc = backFireDefectsPerKNcSlocTable[i]
                numWorkHoursPerFp = backFireWorkHoursPerFpTable[i]
                defaultProgrammingLanguage = programmingLanguage
                continue
            }
        }
        
        if defaultProgrammingLanguage == "Java" {
            ncSlocPerFp = 53.33
            languageLevel = 6.0
            numDefectsPerKNcSloc = 6.39
            numWorkHoursPerFp = 12.70
        }
        
        return (ncSlocPerFp, languageLevel, numDefectsPerKNcSloc, numWorkHoursPerFp)
        
    } // end computeBackfiredNcSlocPerFP
    
    
    func computeNumOfFunctionPoints(_ projectNcSloc: Double, ncSlocPerFp: Double) -> Double {
        
        return projectNcSloc / ncSlocPerFp
        
    } // end computeNumOfFunctionPoints
    
    
    func computeProgrammingProductivity(_ ncSloc: Double, devEffort: Double, findEffort: Double, reworkEffort: Double) -> Double? {
        
        //+
        // Programming Productivity:
        //
        //      Source:  R.B. Grady and D.L. Caswell, "Software Metrics:  Establishing a Company-Wide Program", p. 226,
        //                                             Prentice-Hall, 1987.
        //-
        
        let programmingProductivity = (ncSloc / ((devEffort + findEffort + reworkEffort) / hoursPerMonth))
        
        if programmingProductivity <  1 {
            print("Programming Productivity must be >= 1", terminator: "")
            return nil
        }
        
        return programmingProductivity
        
    } // end computeProgrammingProductivity
    
    
    func computeDefectDensity(_ issueCount: Double, ncSloc: Double) -> Double? {
        
        //+
        // Defect Density:
        //
        //      Source:  R.B. Grady and D.L. Caswell, "Software Metrics:  Establishing a COmpany-Wide Program", p. 226,
        //                                             Prentice-Hall, 1987.
        //-
        
        let defectDensity = (issueCount * k1000) / ncSloc
        
        if defectDensity <= 0.0 {
            print("Defect Density must be > 0", terminator: "")
            return nil
        }
        
        return defectDensity
        
    } // computeDefectDensity
    
    
    func computeQualityIndex(_ issueCount: Double, ncSloc: Double) -> Double {
        
        //+
        // Quality Index:
        //
        //        Source:  D.F. Rico, "ROI of Software Process Improvement", pp. 44-45, J. Ross Publishing, 2004.
        //-
        
        var numDefects = issueCount
        
        if numDefects >= ncSloc {
            numDefects = ncSloc
        }
        
        return (100.0 - ((numDefects * k1000) / ncSloc))
        
    } // end computeQualityIndex
    
    
    func computeDefectsBySeverityLevel(_ projectIssueCount: Double) -> (Double, Double, Double, Double) {
        
        //+
        // Defect Severity Level Definitions:
        //
        //        Source 1:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 19.3, p. 169,
        //                              CRC Press, 2017.
        //
        //        Source 2:  R.H. Grady and D.L. Caswell, "Software Metrics: Establishing a Company-Wide Program", p. 226,
        //                                                 Prentice-Hall, 1987.
        //-
        
        let defectsBySeverityLevel1 = floorOrCeiling(0.02 * projectIssueCount)
        let defectsBySeverityLevel2 = floorOrCeiling(0.18 * projectIssueCount)
        let defectsBySeverityLevel3 = floorOrCeiling(0.35 * projectIssueCount)
        let defectsBySeverityLevel4 = floorOrCeiling(0.45 * projectIssueCount)
        
        return (defectsBySeverityLevel1, defectsBySeverityLevel2, defectsBySeverityLevel3, defectsBySeverityLevel4)
        
    } // end computeDefectsBySeverityLevel
    
    
    func computeNumPotentialDefectsLeft(_ cmmiMaturityLevel: Double, numFp: Double, issueCount: Double) -> Double? {
        
        func interpolatedDefectPotentialPerFp (numFp: Double) -> Double? {
            
            //+
            // fPSizeTable
            //
            //    Source:  C. Jones, "Quantifying Software:  Global and Industry Perspectives", Table 4.17, p. 256,
            //                        CRC Press, 2018.
            //-
            
            let fpSizeTable = [1.0, 10.0, 100.0, 1000.0, 10000.00, 100000.0, 1000000.0]
            
            //+
            // defectPotentialPerFpTable:
            //
            //    Source:  C. Jones, "Quantifying Software:  Global and Industry Perspectives", Table 4.17, p. 256,
            //                        CRC Press, 2018.
            //-
            
            let defectPotentialPerFpTable = [1.50, 2.50, 3.25, 4.75, 6.50, 8.25, 16.50]
            
            
            // Find the Interpolated Defects per Fp Value
            
            for i in 1 ..< fpSizeTable.count {
                
                if numFp >= fpSizeTable[i - 1] && numFp <= fpSizeTable[i] {
                    
                    let y = defectPotentialPerFpTable[i - 1] + (abs((defectPotentialPerFpTable[i] - defectPotentialPerFpTable[i - 1])) * (numFp / fpSizeTable[i]))
                    return y
                }
            }
            
            return nil
            
        } // end interpolatedDefectPotentialPerFp
        
        //+
        // Defect Potential Exponent Constants:
        //
        //    Source: C. Jones, "The Economics of Software Quality", Table 2.13, pp. 72-73, Addison-Wesley, 2012.
        //-
        
        let cmmiLevel1PotentialExponent = 1.20    // For CMMI Maturity Level 1
        let cmmiLevel2PotentialExponent = 1.20    // For CMMI Maturity Level 2
        let cmmiLevel3PotentialExponent = 1.19    // For CMMI Maturity Level 3
        let cmmiLevel4PotentialExponent = 1.19    // For CMMI Maturity Level 4
        let cmmiLevel5PotentialExponent = 1.18    // For CMMI Maturity Level 5
        
        //+
        // Table of Exponents by CMMI Maturity Level
        //-
        
        let potentialDefectsExponentTable = [cmmiLevel1PotentialExponent, cmmiLevel2PotentialExponent, cmmiLevel3PotentialExponent, cmmiLevel4PotentialExponent, cmmiLevel5PotentialExponent]
        
        //+
        // Named Constant for 100,000.0 Fps
        //-
        
        let c100000Fp = 100000.0
        
        
        // Compute # of the Potential Defects per Fp
        
        let numPotentialDefectsPerFp = interpolatedDefectPotentialPerFp(numFp: numFp)
        
        guard numPotentialDefectsPerFp != nil else {
            
            return nil
        }
        
        
        // Compute the Potential Defects Left
        
        var numPotentialDefectsLeft = Double(Int((numFp * numPotentialDefectsPerFp!) - issueCount) + 1)
        
        
        // See if number of potential defects <= 0, then recompute
        
        if numPotentialDefectsLeft <= 0.0 {
            
            let numPotentialDefectsExponent = potentialDefectsExponentTable[Int(cmmiMaturityLevel) - 1]
            numPotentialDefectsLeft = Double(Int(pow(numFp, numPotentialDefectsExponent)) + 1) - issueCount
        }
        
        if numFp > c100000Fp {
            numPotentialDefectsLeft *= 0.70
        }
        
        if numPotentialDefectsLeft < 0.0 {
            numPotentialDefectsLeft = 0.0
        }
        
        return numPotentialDefectsLeft
        
    } // end computeNumPotentialDefectsLeft
    
    
    
    func computeDefectsLeft(_ numPotentialDefectsLeft: Double) -> (Double, Double, Double, Double, Double, Double, Double) {
        
        //+
        //    Defect Potential Left by Phase:
        //
        //        Source 1:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 19.9, p. 175,
        //                              CRC Press, 2017.
        //
        //        Source 2:  R. Blair, adjusted based on software engineering experience to cover datum not included
        //                             in Table 19.9.
        //-
        
        let reqDefectsLeft = floorOrCeiling(0.188 * numPotentialDefectsLeft)
        let desDefectsLeft = floorOrCeiling(0.224 * numPotentialDefectsLeft)
        let codeDefectsLeft = floorOrCeiling(0.271 * numPotentialDefectsLeft)
        let securityDefectsLeft = floorOrCeiling(0.059 * numPotentialDefectsLeft)
        let docDefectsLeft = floorOrCeiling(0.106 * numPotentialDefectsLeft)
        let testDefectsLeft = floorOrCeiling(0.082 * numPotentialDefectsLeft)
        let badfixDefectsLeft = floorOrCeiling(0.070 * numPotentialDefectsLeft)
        
        return (reqDefectsLeft, desDefectsLeft, codeDefectsLeft, securityDefectsLeft, docDefectsLeft, testDefectsLeft, badfixDefectsLeft)
        
    } // end computeDefectsLeft
    
    
    func computeNumInjectedDefectsPerEm(_ issueCount: Double, totalProjectEffort: Double, teamSize: Double) -> Double? {
        
        let numInjectedDefectsPerMonth = issueCount / ((totalProjectEffort / teamSize) / hoursPerMonth)
        
        if numInjectedDefectsPerMonth < 1 {
            print("Number of Injected Defects per Month must be >= 1", terminator: "")
            return nil
        }
        
        return numInjectedDefectsPerMonth
        
    } // end computeNumInjectedDefectsPerMonth
    
    
    func computeCmmiLevelByProductivity(_ programmingProductivity: Double, ncSlocPerFp: Double) -> Double {
        
        func computeJavaCmmiLevelByProductivity(_programmingProductivity: Double) -> Double {
            
            //+
            //    Java Productivity by CMMI Maturity Levels
            //
            //        Source 1:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 7.1, pp. 60-62,
            //                              CRC Press, 2017.
            //
            //        Source 2:  C. Jones, Private Communication, "Software Development Productivity Expressed in
            //                                                     Work Hours per Function Point and Lines of Code
            //                                                     Per Month", 2014.
            //-
            
            let ncSloc440Point00 = 440.00            // Java Productivity in NCSLOC for Level 1
            let ncSloc454Point40 = 454.40            // Java Productivity in NCSLOC for Level 2
            let ncSloc477Point33 = 477.33            // Java Productivity in NCSLOC for Level 3
            let ncSloc502Point93 = 502.93            // Java Productivity in NCSLOC for Level 4
            let ncSloc563Point20 = 563.20            // Java Productivity in NCSLOC for Level 5
            
            var javaCmmiMaturityLevelByProductivity = 1.0
            
            // Determine Java CMMI Maturity Level
            
            switch programmingProductivity {
            case 1.0 ... ncSloc440Point00:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel1
                
            case ncSloc440Point00 ... ncSloc454Point40:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel2
                
            case ncSloc454Point40 ... ncSloc477Point33:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel3
                
            case ncSloc477Point33 ... ncSloc502Point93:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel4
                
            case ncSloc502Point93 ... ncSloc563Point20:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel5
                
            default:
                javaCmmiMaturityLevelByProductivity = cmmiMaturityLevel5
                
            }
            
            return javaCmmiMaturityLevelByProductivity
            
        } // end computeJavaCmmiLevelByProductivity
        
        
        //+
        // Determine if Java is the programming language
        //-
        
        var javaCmmiMaturityLevelByProductivity = 0.0
        
        if projectProgrammingLanguage == "Java" {
            javaCmmiMaturityLevelByProductivity = computeJavaCmmiLevelByProductivity(_programmingProductivity: programmingProductivity)
        }
        
        
        //+
        // Now, determine CMMI Level in terms of the C-Language by calibration
        // from the programming language specified to the C-Language
        //-
        
        //+
        // Productivity Levels in NCSLOC by CMMI Maturity Level for the C Language
        //
        //    Combination of:
        //
        //        Source 1:  C. Jones, "Estimating Software Costs, 2nd Edition", p. 166, McGraw-Hill, 2007.
        //
        //        Source 2:  C. Jones, Private Communication:  "Quality and Productivity Comparison of 13 Selected
        //                                                      Software Development Methodologies", 2016.
        //
        //        Source 3:  R. Blair, Modified above based on software engineering experience.
        //-
        
        let ncSloc473 = 473.0               // Productivity in NCSLOC for Level 1
        let ncSloc588 = 588.0               // Productivity in NCSLOC for Level 2
        let ncSloc703 = 703.0               // Productivity in NCSLOC for Level 3
        let ncSloc938 = 938.0               // Productivity in NCSLOC for Level 4
        let ncSloc1125 = 1125.0             // Productivity in NCLSOC for Level 5
        
        //+
        // Determine Language Multipler
        //-
        
        let cLangSlocPerFp = 128.00         // C-Language productivity in NcSLOC per Em
        var languageMultiplier = 1.0
        
        if cLangSlocPerFp >= ncSlocPerFp {
            languageMultiplier = cLangSlocPerFp / ncSlocPerFp
        } else {
            languageMultiplier = ncSlocPerFp / cLangSlocPerFp
        }
        
        // Compute calibrated programmer productivity in C-Langauge Terms
        
        let calibratedProgrammingProductivity = Double(Int(programmingProductivity * languageMultiplier))
        
        switch calibratedProgrammingProductivity {
        case 1.0 ... ncSloc473:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel1
            
        case ncSloc473 ... ncSloc588:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel2
            
        case ncSloc588 ... ncSloc703:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel3
            
        case ncSloc703 ... ncSloc938:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel4
            
        case ncSloc938 ... ncSloc1125:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel5
        default:
            cmmiMaturityLevelByProductivity = cmmiMaturityLevel5
        }
        
        cmmiMaturityLevelByProductivity = max(javaCmmiMaturityLevelByProductivity, cmmiMaturityLevelByProductivity)
        
        return cmmiMaturityLevelByProductivity
        
    } // end computeCmmiLevelByProductivity
    

    func computeCmmiLevelByDefectsPerFp(_ issueCount: Double, ncSloc: Double, ncSlocPerFp: Double) -> Double {
        
        //+
        // Number of Defects per Function Point (FP) by CMMI Maturity Level
        //
        //      Source:  C. Jones, "Estimating Software Costs: Second Edition", p. 166, McGraw-Hill, 2007.
        //-
        
        let defectsPer0Pt90Fp = 0.90          // 0.90 defects per FP for Level 1
        let defectsPer0Pt50Fp = 0.50          // 0.50 defects per FP for Level 2
        let defectsPer0Pt28Fp = 0.28          // 0.28 defects per FP for Level 3
        let defectsPer0Pt15Fp = 0.15          // 0.15 defects per FP for Level 4
        let defectsPer0Pt08Fp = 0.08          // 0.08 defects per FP for Level 5
        
        let defectsPerFP = (issueCount / ncSloc) * ncSlocPerFp
        var cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel1
        
        switch defectsPerFP {
            
        case 0.0 ... defectsPer0Pt08Fp:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel5
            
        case defectsPer0Pt08Fp ... defectsPer0Pt15Fp:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel4
            
        case defectsPer0Pt15Fp ... defectsPer0Pt28Fp:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel3
            
        case defectsPer0Pt28Fp ... defectsPer0Pt50Fp:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel2
            
        case defectsPer0Pt50Fp ... defectsPer0Pt90Fp:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel1
            
        default:
            cmmiMaturityLevelByDefectsPerFp = cmmiMaturityLevel1
        }
        
        return cmmiMaturityLevelByDefectsPerFp
        
    } // end computeCmmiLevelByDefectsPerFP
    
    
    func computeFinalCmmiMaturityLevel(_ cmmiMaturityLevelByProductivity: Double, cmmiMaturityLevelByDefectsPerFp: Double) -> Double {
        
        //+
        // Compute the final CMMI Maturity Level, using an average of the "cmmiMaturityLevelByProductivity" and
        //      "cmmiMaturityLevelByDefectsPerFp".
        // If the Maturity Levels are different but consecutively clustered, then use the higher Maturity Level of the two.
        //-
        
        let finalMaturityLevel = (Double) (((Int(cmmiMaturityLevelByProductivity) + Int(cmmiMaturityLevelByDefectsPerFp)) / 2) + ((Int(cmmiMaturityLevelByProductivity) + Int(cmmiMaturityLevelByDefectsPerFp)) % 2))
        
        return finalMaturityLevel
        
    } // computeFinalCmmiMaturityLevel
    
    
    func computeDefectsDetectedAndLeakedPerEm(_ cmmiMaturityLevel: Double, numInjectedDefects: Double) -> (dd: Double, dl: Double, qd: Double, ql: Double, industryAvgDre: String)? {
        
        //+
        // Industry Average Removal Effectiveness by CMMI Maturity Level:
        //
        //    Source:  C. Jones, "A Guide to Software Measures and Metrics", Table 16.8, p. 139, CRC Press, 2017.
        //-
        
        let capabilityBasedDRETable = ["87%", "90", "96%", "98%", "99%"]
        
        var dd: Double              // # of Development Defects Detected per Engineering Month
        var dl: Double              // # of Development Defects Leaked per Engineering Month
        var qd: Double              // # of QA Defects Detected per Engineering Month
        var ql: Double              // # of QA Defecgts Leaked per Engineering Month
        var capabilityBasedDRE: String  // Capability Based Defect Removal Efficency Based on CMMI Matuirty Level
        
        
        //+
        // Compute the # of defects detected and leaked by development and QA, respectively as a function of CMMI Maturity Level
        //
        //    Source 1:  C. Jones, Private Commmunication:  "Quality and Productivity Comparison of 13 Selected Software
        //                                                   Development Methodologies",2016.
        //
        //    Source 2:  D. O'Neil, "Determining Return on Investment Using Software Inspections", CrossTalk, Journel of
        //                              Defense Software Engineering, March 2003.
        //-
        
        switch cmmiMaturityLevel {
        case cmmiMaturityLevel1:
            dd = 0.450 * numInjectedDefects      // Development takes into account pre-test defects detection at
                                                 // CMMI Maturity Level 1
            dl = 0.550 * numInjectedDefects
            qd = 0.700 * dl
            ql = 0.300 * dl
            capabilityBasedDRE = capabilityBasedDRETable[Int(cmmiMaturityLevel1) - 1]
            
        case cmmiMaturityLevel2:
            dd = 0.562 * numInjectedDefects     // Development takes into account pre-test defects detection at
                                                // CMMI Maturity Level 2
            dl = 0.438 * numInjectedDefects
            qd = 0.752 * dl
            ql = 0.248 * dl
            capabilityBasedDRE = capabilityBasedDRETable[Int(cmmiMaturityLevel2) - 1]
            
        case cmmiMaturityLevel3:
            dd = 0.675 * numInjectedDefects     // Development takes into account pre-test defects detection at
                                                // CMMI Maturity Level 3
            dl = 0.325 * numInjectedDefects
            qd = 0.805 * dl
            ql = 0.195 * dl
            capabilityBasedDRE = capabilityBasedDRETable[Int(cmmiMaturityLevel3) - 1]
            
        case cmmiMaturityLevel4:
            dd = 0.742 * numInjectedDefects     // Development takes into account pre-test defects detection at
                                                // CMMI Maturity Level 4
            dl = 0.258 * numInjectedDefects
            qd = 0.840 * dl
            ql = 0.160 * dl
            capabilityBasedDRE = capabilityBasedDRETable[Int(cmmiMaturityLevel4) - 1]
            
        case cmmiMaturityLevel5:
            dd = 0.810 * numInjectedDefects     // Development takes into account pre-test defects detection at
                                                // CMMI Maturity Level 5
            dl = 0.190 * numInjectedDefects
            qd = 0.840 * dl
            ql = 0.160 * dl
            capabilityBasedDRE = capabilityBasedDRETable[Int(cmmiMaturityLevel5) - 1]
            
        default:
            print("CMMI Maturity Level must be 1, 2, 3, 4 or 5.", terminator: "")
            return nil
            
        }
        
        dd = Double(Int(dd) + 1)
        qd = Double(Int(qd) + 1)
        
        if (dd + qd) >= numInjectedDefects {
            qd -= 1
        }
        
        return (dd, dl, qd, ql, capabilityBasedDRE)
        
    } // end computeDefectsDetectedAndLeakedPerEm
    
    
    func computeDefectRemovalEffectiveness(_ dd: Double, qd: Double, ql: Double) -> Double? {
        
        //+
        // Definition of Defect Removal Effectiveness:
        //
        //  Source:  S. H. Kan, "Metrics and Models in Software Engineering Quality, 2nd Edition", p. 160,
                                    // Addison-Wesley, 2003.
        //-
        
        //+
        // Where:  dd is number of defects detected by software inspection (development) per Engineering Month
        //         qd is number of defects detected by qa (quality assurance) per Engineering Month
        //         ql is the number of defects leaked by qa per Engineering Month
        //-
        
        let defectRemovalEffectiveness = ((dd + qd) / (dd + qd + ql))
        
        if defectRemovalEffectiveness == 0.0 {
            
            print("Defect Removal Efficency must be > 0%. ", terminator: "")
            return nil
        }
        
        return defectRemovalEffectiveness
        
    } // end computeDefectRemovalEffectiveness
    
    
    func computeUsaAverageDREandDDE(_ numFp: Double) -> (Double, Double)? {
        
        //+
        // USA Average Defect Removal Effeictiveness (DRE) and USA Average Defect Detection Effectiveness (DDE) Constants:
        //
        //  Source 1:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 16.11, p. 144, CRC Press, 2017.
        //
        //  Source 2:  C. Jones, "The Economics of Software Quality", Table 2.14, p. 75, Addison-Wesley, 2012.
        //-
        
        let usaAverageDREPoint9966 = 0.997      // USA Average DRE for 1 FP
        let usaAverageDREPoint9879 = 0.988      // USA Average DRE for 10 FP
        let usaAverageDREPoint9571 = 0.957      // USA Average DRE for 100 FP
        let usaAverageDREPoint9360 = 0.936      // USA Average DRE for 1,000 FP
        let usaAverageDREPoint9045 = 0.905      // USA Average DRE for 10,000 FP
        let usaAverageDREPoint8700 = 0.870      // USA Average DRE for 100,000 FP
        let usaAverageDREPoint7965 = 0.797      // USA Average DRE for >= 1,000,000 FP
        
        let usaAverageDDEPoint99 = 0.99         // USA Average DDE for 1 FP
        let usaAverageDDEPoint97 = 0.97         // USA Average DDE for 10 FP
        let usaAverageDDEPoint94 = 0.94         // USA Average DDE for 100 FP
        let usaAverageDDEPoint90 = 0.90         // USA Average DDE for 1,000 FP
        let usaAverageDDEPoint88 = 0.88         // USA Average DDE for 10,000 FP
        let usaAverageDDEPoint85 = 0.85         // USA Average DDE for 100,000 FP
        let usaAverageDDEPoint85a = 0.85        // Usa Average DDE for >= 1,000,000 FP
        
        var usaAverageDRE = 0.0                 // USA Average Defect Removal Effectiveness
        var usaAverageDDE = 0.0                 // USA Average Defect Detection Effectiveness
        
        switch numFp {
            
        case 1.0 ..< 10.0:
            usaAverageDRE = usaAverageDREPoint9966
            usaAverageDDE = usaAverageDDEPoint99
            
        case 10.0 ..< 100.0:
            usaAverageDRE = usaAverageDREPoint9879
            usaAverageDDE = usaAverageDDEPoint97
            
        case 100.0 ..< 1000.0:
            usaAverageDRE = usaAverageDREPoint9571
            usaAverageDDE = usaAverageDDEPoint94
            
        case 1000.0 ..< 10000.0:
            usaAverageDRE = usaAverageDREPoint9360
            usaAverageDDE = usaAverageDDEPoint90
            
        case 10000.0 ..< 100000.0:
            usaAverageDRE = usaAverageDREPoint9045
            usaAverageDDE = usaAverageDDEPoint88
            
        case 100000.0 ..< 1000000.0:
            usaAverageDRE = usaAverageDREPoint8700
            usaAverageDDE = usaAverageDDEPoint85
            
        case 1000000 ... 10000000:
            usaAverageDRE = usaAverageDREPoint7965
            usaAverageDDE = usaAverageDDEPoint85a
            
        default:
            print("Invalid USA Average DRE and DDE computation. ", terminator: "")
            return nil
            
        }
        
        return (usaAverageDRE, usaAverageDDE)
        
    } // end computeDefectDetectionEffectiveness
    
    
    func computeFindAndFixEffortPerDefect(_ findEffort: Double, fixEffort: Double, issueCount: Double) -> Double? {
        
        let findAndFixEffortPerDefect = ((findEffort + fixEffort) / issueCount)
        
        if findAndFixEffortPerDefect == 0.0 {
            print("Find and Fix Effort Per Defect must be > 0", terminator: "")
            return nil
        }
        
        return findAndFixEffortPerDefect
        
    } // end computeFindAndFixEffortPerDefect
    
    
    func computeNumDefectsLeakedToUsers(_ numInjectedDefects: Double, dd: Double, qd: Double) -> Double {
        
        //+
        // Where dd = # of defects detected by software inspection (development) per Engineering Month
        //       qd = # of defects detected by qa per Engineering Month
        //-
        
        return numInjectedDefects - (dd + qd)
        
    } // end computeNumDefectsLeakedToUsers
    
    
    func computeProjectDurationInMonths(_ totalProjectEffort: Double, teamSize: Double) -> Double? {
        
        let projectDuration = ((totalProjectEffort / teamSize) / hoursPerMonth)
        
        if projectDuration < 1.0 {
            print("Project Effort must be >= 1", terminator: "")
            return nil
        }
        
        return projectDuration
        
    } // end computeProjectDurationInMonths
    
    
    func computeAvgBurdenedLaborRate(_ projectAvgAnnualSalary: Double) -> Double? {
        
        let avgBurdenedLaborRate = projectAvgAnnualSalary / hoursPerYear
        
        if avgBurdenedLaborRate < 1.00 {
            print("Average Burdened Labor Rate must be >= 1.00.", terminator: "")
            return nil
        }
        
        return floorOrCeiling(avgBurdenedLaborRate)
        
    } // end computeAvgBurdenedLaborRate
    
    
    func computeProgrammingUnitCostPerEm(_ avgBurdenedLaborRate: Double, programmingProductivity: Double) -> Double {
        
        return (avgBurdenedLaborRate * hoursPerMonth) / programmingProductivity
        
    } // end computeProgrammingUnitCostPerEm
    
    
    func computeTeamCostPerEm(_ avgBurdenedLaborRate: Double, teamSize: Double) -> Double {
        
        return avgBurdenedLaborRate * teamSize * hoursPerMonth
        
    } // end computeTeamCostPerEm
    
    
    func computeDCUTCost(_ numFp: Double, numWorkHoursPerFp: Double, avgBurdenedLaborRate: Double) -> Double {
        
        //+
        // Estimated Design, Code and Test Costs:
        //
        //      Source:  C. Jones, "A Guide to Selecting Measures and Metrics", Table 10.2, pp. 80-82, CRC Press, 2017.
        //-
        
        let DCUTPercentOfEffort = 0.312
        
        return Double(Int(DCUTPercentOfEffort * (numFp * numWorkHoursPerFp * avgBurdenedLaborRate)))
        
    } // end computeDCUTCost
    
    
    func computeProjectAndPhaseEfforts(_ teamSize: Double, projectEffortInMonths: Double) -> (projectEffort: Double, requirementsEffort: Double, designEffort: Double, codeEffort: Double, testEffort: Double) {
        
        //+
        // Software Development Phase Effort Distribution
        //
        //    Source 1:  Y. Yang, et al, "Phase Distribution of Software Development Effort", "Proceedings of the 2008
                                            // ACM-IEEE International Symposium of Empirical Software Engineering and
                                            // Measurement", pp. 61-69, Kaiserslautern, Germany, October 9-10, 2008.
        //
        //    Source 2:  F.P. Brooks Jr, "The Mythical Man-Month:  Essays in Software Engineering - Anniversary Edition",
                                            // p. 20, Addison-Wesley, 1995.
        //
        //    Source 3:  R.B. Grady, "Practical Software Metricss for Project Management and Process Improvement", p. 14,
                                        // Prentice-Hall, 1992.
        //
        //    Source 4:  R. Blair, modified above and adapted based on personal software engineering experience.
        //-
        
        let requirementsPercent = 0.16
        let designPercent = 0.14
        let codePercent = 0.30
        let testPercent = 0.40
        
        //+
        // Compute the Project and Phase Efforts
        //-
        
        let projectEffort = floorOrCeiling(teamSize * projectDurationInMonths)
        
        var requirementsEffort = floorOrCeiling(requirementsPercent * projectEffort)
        if requirementsEffort < 1.0 {
            requirementsEffort = 1.0
        }
        
        var designEffort = floorOrCeiling(designPercent * projectEffort)
        if designEffort < 1.0{
            designEffort = 1.0
        }
        
        let codeEffort = floorOrCeiling(codePercent * projectEffort)
        let testEffort = floorOrCeiling(testPercent * projectEffort)
        
        return (projectEffort, requirementsEffort, designEffort, codeEffort, testEffort)
        
    } // end computeProjectAndPhaseEfforts
    
    
    func computeProjectAndPhaseStaffing(_ teamSize: Double) -> (projectStaffing: Double, reqPhaseStaffing: Double, desPhaseStaffing: Double, codePhaseStaffing: Double, testPhaseStaffing: Double) {
        
        //+
        // Software Development Phase Staffing Distribution
        //
        //        Source 1:  R. Blair, based on personal software enginerring experience and data.
        //
        //        Source 2:  Static data above used in lieu of dynamic historical data required for Rayleigh Curve
                                // Distribution computation.
        //-
        
        let requirementsPhaseStaffingPercent = 0.25
        let designPhaseStaffingPercent = 0.375
        let codePhaseStaffingPercent = 1.00
        let testPhaseStaffingPercent = 0.75
        
        let projectStaffing = floorOrCeiling(teamSize)
        
        var requirementsPhaseStaffing = floorOrCeiling(requirementsPhaseStaffingPercent * teamSize)
        if requirementsPhaseStaffing < 1.0 {
            requirementsPhaseStaffing = 1.0
        }
        
        var designPhaseStaffing = floorOrCeiling(designPhaseStaffingPercent * teamSize)
        if designPhaseStaffing < 1.0 {
            designPhaseStaffing = 1.0
        }
        
        var codePhaseStaffing = min(floorOrCeiling(codePhaseStaffingPercent * teamSize), teamSize)
        if codePhaseStaffing < 1.0 {
            codePhaseStaffing = 1.0
        }
        
        var testPhaseStaffing = floorOrCeiling(testPhaseStaffingPercent * teamSize)
        if testPhaseStaffing < 1.0 {
            testPhaseStaffing = 1.0
        }
        
        return (projectStaffing, requirementsPhaseStaffing, designPhaseStaffing, codePhaseStaffing, testPhaseStaffing)
        
    } // end computeProjectAndPhaseStaffing
    
    
    func computeTotalDevelopmentCost(_ projectDuration: Double, teamCostPerEm: Double) -> Double {
        
        return projectDuration * teamCostPerEm
        
    } // computeTotalDevelopmentCost
    
    
    func computeLifetimeMaintenanceCost(_ totalDevelopmentCost: Double) -> Double {
        
        //+
        // Maintenance Cost Percent:
        //
        //    Source:  Brooks, F.P. Jr, "Mythical Man-Month:  Essays in Software Engineering - Anniversary Editiion", p. 121,
        //             Addison-Wesley, 1995.
        //-
        
        let maintenanceCostPercent = 0.40
        
        return maintenanceCostPercent * totalDevelopmentCost
        
    } // end computeLifetimeMaintenanceCost
    
    
    func computeTotalProjectCost(_ totalDevelopmentCost: Double, lifetimeMaintenanceCost: Double) -> Double {
        
        return totalDevelopmentCost + lifetimeMaintenanceCost
        
    } // end computeTotalProjectCost
    
    
    func computeFindFixPercentageOfTotalCostsDueToDefects(_ findEffort: Double, reworkEffort: Double, totalProjectEffort: Double) -> Double? {
        
        let findFixDefectPercent = floorOrCeiling(((findEffort + reworkEffort) / totalProjectEffort) * 100)
        
        if findFixDefectPercent < 1.0 {
            print("Find and Fix Defect Percent must be >= 1%", terminator: "")
            return nil
        }
        
        return findFixDefectPercent
        
    } // end computeFindFixPercentageOfTotalCostsDueToDefects
    
    
    func computeCostDueToFindAndFixDefects(_ findEffort: Double, reworkEffort: Double, avgBurdenedLaborRate: Double) -> Double {
        
        return (findEffort + reworkEffort) * avgBurdenedLaborRate
        
    } // end costDueToFindAndFixDefects
    
    
    func computeTechnicalDebt(cmmiMaturityLevel: Double) -> Double {
        
        //+
        //  Technical Debt:
        //
        //      Source:  Private Communication, C. Jones, "Quality and Productivity Comparison of 13 Selected Software
                                                           // Development Methodologies", 2016.
        //-
        
        let technicalDebtLevel1 = 303465.0
        let technicalDebtLevel2 = 151732.0
        let technicalDebtLevel3 = 101852.0
        let technicalDebtLevel4 = 50926.0
        let technicalDebtLevel5 = 32857.0
        
        let technicalDebtByMaturityLevelTable =
            [technicalDebtLevel1, technicalDebtLevel2, technicalDebtLevel3, technicalDebtLevel4, technicalDebtLevel5]
        
        return technicalDebtByMaturityLevelTable[Int(cmmiMaturityLevel) - 1]
        
    }
    
    
    func computeNumPreAndPostReleaseDefects(_ defectRemovalEffectiveness: Double, issueCount: Double, postReleaseIndicator: String) -> (Double, Double) {
        
        var numPostReleaseDefects = (1.0 - defectRemovalEffectiveness) * issueCount
        var numPreReleaseDefects = 0.0
        
        if postReleaseIndicator == upCaseY || postReleaseIndicator == lowerCaseY {
            
            numPreReleaseDefects = defectRemovalEffectiveness * issueCount
            
        } else {
            numPreReleaseDefects = issueCount
        }
        
        numPreReleaseDefects = Double(Int(numPreReleaseDefects))
        
        numPostReleaseDefects = Double(Int(numPostReleaseDefects) + 1)
        
        return (numPreReleaseDefects, numPostReleaseDefects)
        
    } // end computeNumPreReleaseAndPostReleaseDefects
    
    
    func computeExpectedDeliveredDefects(numFp:  Double) -> Double? {
        
        func interpolatedDefectsPerFp (numFp: Double) -> Double? {
            
            //+
            // fPSizeTable
            //
            //    Source:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 16.11, p. 144,
                                      // CRC Press, 2017.
            //-
            
            let fpSizeTable = [1.0, 10.0, 100.0, 1000.0, 10000.00, 100000.0, 1000000.0]
            
            //+
            // defectsPerFpTable
            //
            //    Source:  C. Jones, "A Guide to Selecting Software Measures and Metrics", Table 16.11, p. 144,
                                      // CRC Press, 2017.
            //-
            
            let defectsPerFpTable = [0.004, 0.026, 0.127, 0.209, 0.497, 0.860, 1.628]
            
            // Find the interpolated defects per function point value
            
            for i in 1 ..< fpSizeTable.count {
                
                if numFp >= fpSizeTable[i - 1] && numFp <= fpSizeTable[i] {
                    
                    let y = defectsPerFpTable[i - 1] + (abs((defectsPerFpTable[i] - defectsPerFpTable[i - 1])) * (numFp / fpSizeTable[i]))
                    return y
                }
            }
            
            return nil
            
        } // end interpolatedDefectsPerFp
        
        let interpretedDefectsPerFp = interpolatedDefectsPerFp(numFp: numFp)
        
        guard interpretedDefectsPerFp != nil else {
            
            return nil
        }
        
        return floorOrCeiling(interpretedDefectsPerFp! * numFp)
        
    } // end computeUSAvgDeliveredDefects
    
    
    func computePreReleaseDefectsByPhase(_ numPreReleaseDefects : Double) -> (Double, Double, Double, Double, Double, Double) {
        
        //+
        // PreRelease Defects by Phase:
        //
        //        Source 1:  C. Jones, "Software Engineering Best Practices", Table 9-6, p. 579, McGraw-Hill, 2010.
        //
        //        Source 2:  R. Blair, modified, based on personal software engineering experience.
        //-
        
        let preReqDfs = floorOrCeiling(0.20 * numPreReleaseDefects)
        let preDesDfs = floorOrCeiling(0.25 * numPreReleaseDefects)
        let preCodeDfs = floorOrCeiling(0.35 * numPreReleaseDefects)
        let preTestDfs = floorOrCeiling(0.05 * numPreReleaseDefects)
        let preUserDocDfs = floorOrCeiling(0.08 * numPreReleaseDefects)
        let preBadFixDfs = floorOrCeiling(0.07 * numPreReleaseDefects)
        
        return (preReqDfs, preDesDfs, preCodeDfs, preTestDfs, preUserDocDfs, preBadFixDfs)
        
    } // end omputePreReleaseDefectsByPhase
    
    
    func computeCostEffectivenessIndicator(_ avgAnnualSalary: Double, teamSize: Double, ncSloc: Double, devEffort: Double, issueCount: Double, reworkEffort: Double) -> Double {
        
        //+
        // Cost Effectivenes Indicator Algortithm:
        //
        //        Source:  H. Erodgmus, "A Context-Dependent Cost Effectiveness Indicator for Software Development", 2007.
        //-
        
        let loadFactor = (avgAnnualSalary / industryAverageAnnualSalary) * teamSize
        let productionSpeed = (ncSloc / devEffort) * loadFactor
        let reworkSpeed = (issueCount / reworkEffort) * loadFactor
        let issueDensity = issueCount / ncSloc
        let productionEffectiveness = reworkSpeed / (reworkSpeed + (productionSpeed * issueDensity))
        
        let costEffectivenessIndicator = (productionSpeed * productionEffectiveness) / loadFactor
        return costEffectivenessIndicator
        
    } // end computeCostEffectivenessIndicator

    
    func computeExecutiveDashboardMetrics(_ cmmiMaturityLevel: Double, qualityIndex: Double, costEffectivenessIndicator: Double, defectRemovalEffectiveness: Double) -> (Double, Double, Double, Double)? {
        
        // +
        // ***************** DASHBOARD METRICS DETERMANENT CONSTANTS ******************
        //-
        
        //+
        // Quality Index Levels by CMMI Maturity Level:
        //
        //  Source:  R. Blair, established these, based on software engineering experience.
        //-
        
        let qualityIndexLevel99 = 99.0          // Quality Index Level >= 99 ---> ++
        let qualityIndexLevel98 = 98.0          // Quality Index Level >= 98 ---> +
        let qualityIndexLevel97 = 97.0          // Quality Index Level >= 97 ---> -+
        let qualityIndexLevel92 = 92.0          // Quality Index Level >= 92 ---> -
        // let qualityIndexLevel90 = 90.0       // Quality Index Level >= 90 ---> --
        
        //+
        // Software Process Effectiveness Classifiers by Defect Removal Effectiveness (DRE):
        //
        //  Source:  C. Jones, "Quantifying Software:  Global and Industry Perspectives", Table 4.23, p. 260, CRC Press, 2018
        //-
        
        let softwareProcessEffectivenessLevel99 = 99.00     // for DRE >= 99%
        let softwareProcessEffectivenessLevel97 = 97.00     // for DRE >= 97%
        let softwareProcessEffectivenessLevel96 = 96.00     // for DRE >= 96%
        let softwareProcessEffectivenessLevel90 = 90.00     // for DRE >= 90%
        // for DRE < 87%% & < 90%
        
        //+
        // Cost-Effectiveness Classifiers by Cost-Effectivness Indicator
        //-
        
        let costEffectiveness5 = 5.0            // 5: for Cost-Effectiveness Indicator >= 5
        let costEffectiveness4 = 4.0            // 4: for Cost-Effectiveness Indicator >= 4
        let costEffectiveness3 = 3.0            // 3: for Cost-Effectiveness Indicator >= 3
        let costEffectiveness2 = 2.0            // 2: for Cost-Effectiveness Indicator >= 2
        // let costEffectiveness1 = 1.0         // 1: for Cost-Effectiveness Indicator >= 1
        
        //+
        // Summary Metric Values for C-Level Dashboard on range:  [Lowest, Highest] = [1, 5]
        //-
        
        let summaryMetric1 = 1.0                  // Summary Metric 1: Lowest
        let summaryMetric2 = 2.0                  // Summary Metric 2
        let summaryMetric3 = 3.0                  // Sumaary Metric 3
        let summaryMetric4 = 4.0                  // Summary Metric 4
        let summaryMetric5 = 5.0                  // Summary Metric 5: Highest
        
        //+
        // Variable Declarations
        //_
        
        var productivity = 1.0                      // Executive Productivity Metric for the Dashboard
        var quality = 1.0                           // Executive Quality Metric for the Dashboard
        var costEffectiveness = 1.0                 // Executive Cost-Effectiveness Metric for the Dashboard
        var softwareProcessEffectiveness = 1.0      // Executive Software Process Effectiveness for the Dashboard
        
        // Compute the Productivity Metric
        
        switch cmmiMaturityLevel {
        case cmmiMaturityLevel1:
            productivity = summaryMetric1
        case cmmiMaturityLevel2:
            productivity = summaryMetric2
        case cmmiMaturityLevel3:
            productivity = summaryMetric3
        case cmmiMaturityLevel4:
            productivity = summaryMetric4
        case cmmiMaturityLevel5:
            productivity = summaryMetric5
        default:
            print("CMMI Maturity Level must be 1, 2, 3, 4 or 5.", terminator: "")
            return nil
        }
        
        // Compute the Quality Metric
        
        if qualityIndex >= qualityIndexLevel99 {
            quality = summaryMetric5
        } else if qualityIndex >= qualityIndexLevel98 {
            quality = summaryMetric4
        } else if qualityIndex >= qualityIndexLevel97 {
            quality = summaryMetric3
        } else if qualityIndex >= qualityIndexLevel92 {
            quality = summaryMetric2
        } else {
            quality = summaryMetric1
        }
        
        // Compute Cost-Effectiveness Metric
        
        if costEffectivenessIndicator >= costEffectiveness5 {
            costEffectiveness = summaryMetric5
        } else if costEffectivenessIndicator >= costEffectiveness4 {
            costEffectiveness = summaryMetric4
        } else if costEffectivenessIndicator >= costEffectiveness3 {
            costEffectiveness = summaryMetric3
        } else if costEffectivenessIndicator >= costEffectiveness2 {
            costEffectiveness = summaryMetric2
        } else {
            costEffectiveness = summaryMetric1
        }
        
        // Compute Software Process Effectiveness
        
        if round(defectRemovalEffectiveness) >= softwareProcessEffectivenessLevel99 {
            softwareProcessEffectiveness = summaryMetric5
        } else if round(defectRemovalEffectiveness) >= softwareProcessEffectivenessLevel97 {
            softwareProcessEffectiveness = summaryMetric4
        } else if round(defectRemovalEffectiveness) >= softwareProcessEffectivenessLevel96 {
            softwareProcessEffectiveness = summaryMetric3
        } else if round(defectRemovalEffectiveness) >= softwareProcessEffectivenessLevel90 {
            softwareProcessEffectiveness = summaryMetric2
        } else {
            softwareProcessEffectiveness = summaryMetric1
        }
        
        return (productivity, quality, costEffectiveness, softwareProcessEffectiveness)
        
    } // end computeExecutiveDashboardMetrics
    
    
    func computeRiskFactors(_ numFp: Double) -> (projectFailureRisk: Double, ProjectDelayRisk: Double, ProjectPoorQualityRisk: Double)? {
        
        //+
        // Risk Factors as a Function of Project Function Points
        //
        //        Source 1:  C. Jones, "The Economics of Software Quality", p. 177, Addison-Wesley, 2012.
        //
        //        Source 2:  C. Jones, "A Guide to Selecting Measurements and Metrics", pp. 274-275, CRC Press, 2017.
        //-
        
        let numFp1 = 1.0
        let numFp10 = 10.0
        let numFp100 = 100.0
        let numFp1000 = 1000.0
        let numFp10000 = 10000.0
        let numFp100000 = 100000.0
        let numFp1000000 = 1000000.0
        let numFp10000000 = 10000000.0
        
        var riskFactors = (0.0, 0.0, 0.0)
        
        switch numFp {
            
        case numFp1 ..< numFp10:
            riskFactors = (0.0100, 0.0020, 0.0100)
            
        case numFp10 ..< numFp100:
            riskFactors = (0.0200, 0.0200, 0.0500)
            
        case numFp100 ..< numFp1000:
            riskFactors = (0.0400, 0.0700, 0.1000)
            
        case numFp1000 ..< numFp10000:
            riskFactors = (0.1000, 0.1500, 0.2500)
            
        case numFp10000 ..< numFp100000:
            riskFactors = (0.3000, 0.4000, 0.7500)
            
        case numFp100000 ..< numFp1000000:
            riskFactors = (0.5000, 0.8500, 0.9500)
            
        case numFp1000000 ... numFp10000000:
            riskFactors = (0.6400, 0.8500, 0.9500)
            
        default:
            print("Invalid Risk Factors computation. ")
            return nil
        }
        
        return riskFactors
        
    } //end computeRiskFactors
    
    
    func computeProjectOutcomeFactors(_ numFp: Double) -> (projectOutcomeEarly: Double, projectOutcomeOntime: Double, projectOutcomeDelayed: Double, projectOutcomeCanceled: Double)? {
        
        //+
        // Project Outcome Probablities as a Function of the Number of Function Points
        //
        //        Source:  C. Jones, "Quantifying Software:  Global and Industry Perspectives", p. 75, CRC Press, 2018.
        //-
        
        let numFp1 = 1.0
        let numFp10 = 10.0
        let numFp100 = 100.0
        let numFp1000 = 1000.0
        let numFp10000 = 10000.0
        let numFp100000 = 100000.0
        let numFp1000000 = 1000000.0
        let numFp10000000 = 10000000.0
        
        var outcomeFactors = (0.0, 0.0, 0.0, 0.0)
        
        switch numFp {
            
        case numFp1 ..< numFp10:
            outcomeFactors = (0.01468, 0.8316, 0.0192, 0.0025)
            
        case numFp10 ..< numFp100:
            outcomeFactors = (0.1108, 0.8125, 0.0567, 0.0200)
            
        case numFp100 ..< numFp1000:
            outcomeFactors = (0.0606, 0.7477, 0.1183, 0.0733)
            
        case numFp1000 ..< numFp10000:
            outcomeFactors = (0.0124, 0.6076, 0.1767, 0.2033)
            
        case numFp10000 ..< numFp100000:
            outcomeFactors = (0.0014, 0.2803, 0.2383, 0.4800)
            
        case numFp100000 ..< numFp1000000:
            outcomeFactors = (0.0000, 0.1367, 0.2133, 0.6500)
            
        case numFp1000000 ... numFp10000000:
            outcomeFactors = (0.0000, 0.1367, 0.2133, 0.6500)
            
        default:
            print("*** Invalid Project Completion Percentage. ***")
            return nil
        }
        
        return outcomeFactors
        
    } //end computeProjectOutcomeFactors
    
    
    func computeRealOptionsAnalysis(_ totalDevelopmentCost: Double, finalCmmiMaturityLevel: Double, averageRisk: Double) -> Double {
        
        //+
        // Real Options Analysis Applied to Agile Software Methodology Projects:
        //
        //        Source:  D.F. Rico, "The Buinsess Value of Agile Software Methods", pp. 102-103, 149-157, J. Ross
                                       // Publishing, 2009.
        //-
        
        //+
        // Cumulative Normal Distribution Density Function:  phi
        //-
        
        func phi(z: Double) -> Double {
            
            //+
            // Cumulative Normal Distribution Function:
            //
            //        Source:  Eds: M. Abramowitz & I.A. Stegun, "Handbook of Mathematical Functions", Equation 26.2.17, p. 932, Dover
            //                      Publications, 2013.
            //-
            
            // If z > 5.73, the area under the Cumulative Normal Distribution Curve is 1.0
            
            if z > 5.73 {
                
                return 1.0
                
            }
            
            // Implementation Constants
            
            let a1 =  0.319381530
            let a2 = -0.356563782
            let a3 =  1.781477937
            let a4 = -1.821255978
            let a5 =  1.330274429
            let p  =  0.2316419
            
            //+
            // Compute by series the numerical integration for Equation 26.2.17 as documented above
            //-
            
            let t = 1.0 / (1.0 + p * z)
            let y = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * (1.0 / sqrt(2.0 * Double.pi)) * exp(-((z * z) / 2.0))
            
            return y
            
        } // end phi
        
        //+
        // computeD1 Funciton
        //-
        
        func computeD1(_ benefits: Double, costs: Double, rate: Double, risk: Double, years: Double) -> Double {
            
            let d1 = ((log(benefits / costs) + ((rate + (0.5 * (risk * risk))) * years)) / (risk * sqrt(years)))
            
            return d1
            
        } // end computeD1
        
        //+
        // computeD2 Function
        //-
        
        func computeD2(_ d1: Double, risk: Double, years: Double) -> Double {
            
            let d2 = d1 - (risk * sqrt(years))
            
            return d2
            
        } // end computeD2
        
        
        //+ <*************************************************************>
        //  <**************** realOptionsAnalysis Mainline ***************>
        //- <*************************************************************>
        
        let risk = averageRisk
        let rate = 0.05
        let years = 5.0
        
        //+
        // Benefit Percentage Table by CMMI Maturity Level
        //
        //        Source 1: D.F. Rico, "ROI of Software Process Improvement", pp. 61-62, J. Ross Publishing, 2004.
        //
        //        Source 2: D.F. Rico, "What is the ROI of Agile vs Traditional Methods", p.4, J. Ross Publishing, 2009.
        //
        //            NOTE:  The author states in the second source that his research shows agile methods are 29% nore cost
                             // efficient than CMMI methods.  I have taken that to mean CMMI Maturity Level 3 projects as
                             // the author also discusses CMMI Maturity Level 2 and 3 projects in the first source.
                             // Hence, I have constructed the table below, based on these combined research findings.
        //-
        
        let benefitPercentageTable = [0.10, 0.20, 0.30, 0.40, 0.50]
        
        let costs = totalDevelopmentCost
        let benefitPercentage = benefitPercentageTable[Int(finalCmmiMaturityLevel - 1.0)]
        let benefits = (1.0 + benefitPercentage) * costs
        
        let d1 = computeD1(benefits, costs: costs, rate: rate, risk: risk, years: years)
        let d2 = computeD2(d1, risk: risk, years: years)
        
        let roa = (phi(z: d1) * benefits) - (phi(z: d2) * costs * exp(-(rate * years)))
        
        return floorOrCeiling(roa)           // Estimated corresponding Agile Project Business Value
        
    } // end computeRealOptionsAnalysis
    
    
    //+
    // V************************************************************************************V
    // V******************** CALL COMPUTATION ENGINE METRIC FUNCTIONS **********************V
    // V************************************************************************************V
    //-
    
    var returnValues = [(String, Double?, String?)]()
    
    //+
    // Insert the Project Name for Display on the Executive Dashboard
    //-
    
    returnValues.insert(("OutputIndex00", nil, projectId), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the Project Name for Display on the Project High-Level Metrics
    //-
    
    returnValues.insert(("OutputIndex05", nil, projectId), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the Team Size for Display on the Project High-Level Metrics
    //-
    
    returnValues.insert(("OutputIndex06", projectTeamSize, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Backfired NCSLOC per Function Point
    //-
    

    (ncSlocPerFp, programmingLanguageLevel, numDefectsPerKNcSloc, numWorkHoursPerFp) = computeBackfiredNcSlocPerFp(projectProgrammingLanguage)
    
    
    //+
    // Insert the Programming Language for Display on the Project High-Level Metrics
    //-
    
    returnValues.insert(("OutputIndex09", nil, projectProgrammingLanguage), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the Programming Language Level for Display on the Project High-level Metrics
    //-
    
    returnValues.insert(("OutputIndex09a", programmingLanguageLevel, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the # of NcSloc for Display on the Project High-Level Metrics
    //-
    
    returnValues.insert(("OutputIndex10", projectNcSloc, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the # of Issues for Display on the Project High-Level Metrics
    //-
    
    returnValues.insert(("OutputIndex10a", projectIssueCount, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Insert the # of Issues by Severity Level for Display on the Project High-Level Metrics
    //-
    
    (numSeverity1Defects, numSeverity2Defects, numSeverity3Defects, numSeverity4Defects) = computeDefectsBySeverityLevel(projectIssueCount)
    
    returnValues.insert(("OutputIndex10b", numSeverity1Defects, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex10c", numSeverity2Defects, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex10d", numSeverity3Defects, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex10e", numSeverity4Defects, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Total Project Effor, Development Effort Percent and Test Effort Percent for Display on the Project High-Level Metrics
    //-
    
    (totalProjectEffort, devEffortPercent, testEffortPercent) = computeTotalProjectEffort(projectReqDesEffort, devEffort: projectDevEffort,
            findDefectEffort: projectFindDefectEffort, reworkEffort: projectReworkEffort)
    returnValues.insert(("OutputIndex08", totalProjectEffort, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex08a", devEffortPercent, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex08b", testEffortPercent, nil), at: metricIndex)
    metricIndex += 1
    
    //+
    // Compute Average Burdened Labor Rate for Display on the Project High-Level Metrics
    //-
    
    if let avgLaborRate = computeAvgBurdenedLaborRate(projectAvgAnnualSalary) {
        avgBurdenedLaborRate = avgLaborRate
        returnValues.insert(("OutputIndex07", avgBurdenedLaborRate, nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute Number of Function Points
    //-
    
    numFp = computeNumOfFunctionPoints(projectNcSloc, ncSlocPerFp: ncSlocPerFp)
    
    
    //+
    // Compute Programming Productivity
    //-
    
    if let productivity = computeProgrammingProductivity(projectNcSloc, devEffort: projectDevEffort, findEffort: projectFindDefectEffort, reworkEffort: projectReworkEffort) {
        programmingProductivity = productivity
        returnValues.insert(("OutputIndex12", floorOrCeiling(programmingProductivity), nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute Defect Density
    //-
    
    if let issueDensity = computeDefectDensity(projectIssueCount, ncSloc: projectNcSloc) {
        defectDensity = issueDensity
        returnValues.insert(("OutputIndex15", defectDensity, nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Get Average Defect Density
    //-
    
    returnValues.insert(("OutputIndex15a", numDefectsPerKNcSloc, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Quality Index
    //-
    
    qualityIndex = computeQualityIndex(projectIssueCount, ncSloc: projectNcSloc)
    
    
    //+
    // Compute Number of Injected Defects per Engineering Month
    //-
    
    if let injectedDefectsPerEm = computeNumInjectedDefectsPerEm(projectIssueCount, totalProjectEffort: totalProjectEffort, teamSize: projectTeamSize) {
        numInjectedDefectsPerEm = Double(Int(injectedDefectsPerEm) + 1)
        returnValues.insert(("OutputIndex17", numInjectedDefectsPerEm, nil),  at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute the Estimated CMMI Maturity Level by Productivity
    //-
    
    cmmiMaturityLevelByProductivity = computeCmmiLevelByProductivity(programmingProductivity, ncSlocPerFp: ncSlocPerFp)
    
    
    //+
    // Compute the Estimated CMMI Maturity Level by Defects per Function Point
    //-
    
    cmmiMaturityLevelByDefectsPerFp = computeCmmiLevelByDefectsPerFp(projectIssueCount, ncSloc: projectNcSloc, ncSlocPerFp: ncSlocPerFp)
    
    
    //+
    // Compute the Final Estimated CMMI Maturity Level
    //-
    
    finalCmmiMaturityLevel = computeFinalCmmiMaturityLevel(cmmiMaturityLevelByProductivity, cmmiMaturityLevelByDefectsPerFp: cmmiMaturityLevelByDefectsPerFp)
    returnValues.insert(("OutputIndex11", finalCmmiMaturityLevel, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute # of Potential Defects Left
    //-
    
    let numDefectsLeft = computeNumPotentialDefectsLeft(finalCmmiMaturityLevel, numFp: numFp, issueCount: projectIssueCount)
    guard numDefectsLeft != nil else{
        return nil
    }
    
    numPotentialDefectsLeft = numDefectsLeft!
    returnValues.insert(("OutputIndex16", numPotentialDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute # of Potential Defects by Development Phase Left
    //-
    
    (reqDefectsLeft, desDefectsLeft, codeDefectsLeft, securityDefectsLeft, docDefectsLeft, testDefectsLeft, badfixDefectsLeft) = computeDefectsLeft(numPotentialDefectsLeft)
    
    returnValues.insert(("OutputIndex16a", reqDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16b", desDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16c", codeDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16d", securityDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16e", docDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16f", testDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex16g", badfixDefectsLeft, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute the # of Detected and Leaked Defects per Engineering Month
    //-
    
    if let detectedLeakedDefects = computeDefectsDetectedAndLeakedPerEm(finalCmmiMaturityLevel, numInjectedDefects: numInjectedDefectsPerEm ) {
        
        dd = detectedLeakedDefects.0
        dl = detectedLeakedDefects.1
        qd = detectedLeakedDefects.2
        ql = detectedLeakedDefects.3
        
        returnValues.insert(("OutputIndex18", dd, nil), at: metricIndex)
        metricIndex += 1
        
        returnValues.insert(("OutputIndex19", qd, nil), at: metricIndex)
        metricIndex += 1
        
        returnValues.insert(("OutputIndex22", nil, detectedLeakedDefects.4), at: metricIndex)
        metricIndex += 1
        
    } else {
        return nil
    }
    
    
    //+
    // Compute Defect Removal Effectiveness (DRE)
    //-
    
    if let dre = computeDefectRemovalEffectiveness(dd, qd: qd, ql: ql) {
        defectRemovalEffectiveness = dre
        returnValues.insert(("OutputIndex21", floorOrCeiling(100 * defectRemovalEffectiveness), nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute # of Pre-Release and Post-Release Defects
    //-
    
    let numPreAndPostReleaseDefects = computeNumPreAndPostReleaseDefects(defectRemovalEffectiveness, issueCount: projectIssueCount, postReleaseIndicator: projectPostReleaseIndicator)
    numPreReleaseDefects = numPreAndPostReleaseDefects.0
    returnValues.insert(("OutputIndex13", numPreReleaseDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPostReleaseDefects = numPreAndPostReleaseDefects.1
    returnValues.insert(("OutputIndex14", numPostReleaseDefects, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Estimated US Average Delivered Defects
    //-
    
    expectedDeliveredDefects = computeExpectedDeliveredDefects(numFp: numFp)
    
    guard expectedDeliveredDefects != nil else {
        return nil
    }
    
    returnValues.insert(("OutputIndex140a", expectedDeliveredDefects, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute # of Pre-Release Defects by Development Phase
    //-
    
    let numPreReleaseByPhase = computePreReleaseDefectsByPhase(numPreReleaseDefects)
    
    numPreReleaseRequirementsDefects = numPreReleaseByPhase.0
    returnValues.insert(("OutputIndex14a", numPreReleaseRequirementsDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPreReleaseDesignDefects = numPreReleaseByPhase.1
    returnValues.insert(("OutputIndex14b", numPreReleaseDesignDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPreReleaseCodeDefects = numPreReleaseByPhase.2
    returnValues.insert(("OutputIndex14c", numPreReleaseCodeDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPreReleaseTestDefects = numPreReleaseByPhase.3
    returnValues.insert(("OutputIndex14d", numPreReleaseTestDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPreReleaseUserDocDefects = numPreReleaseByPhase.4
    returnValues.insert(("OutputIndex14e", numPreReleaseUserDocDefects, nil), at: metricIndex)
    metricIndex += 1
    
    numPreReleaseBadFixDefects = numPreReleaseByPhase.5
    returnValues.insert(("OutputIndex14f", numPreReleaseBadFixDefects, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Defect Detection Effectiveness
    //-
    
    if let dreAndDde = computeUsaAverageDREandDDE(numFp) {
        usaAverageDRE = dreAndDde.0
        returnValues.insert(("OutputIndex22a", floorOrCeiling(100 * usaAverageDRE), nil), at: metricIndex)
        metricIndex += 1
        
        usaAverageDDE = dreAndDde.1
        returnValues.insert(("OutputIndex22b", floorOrCeiling(100 * usaAverageDDE), nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute Find and Fix Effort per Defect
    //-
    
    if let findAndFixEffort = computeFindAndFixEffortPerDefect(projectFindDefectEffort, fixEffort: projectReworkEffort, issueCount: projectIssueCount) {
        findAndFixEffortPerDefect = findAndFixEffort
        returnValues.insert(("OutputIndex23", findAndFixEffortPerDefect, nil), at: metricIndex)
        metricIndex += 1
        
        returnValues.insert(("OutputIndex24", estAvgFindFixEffortPerDefect, nil), at: metricIndex)
        metricIndex += 1
        
    } else {
        return nil
    }
    
    
    //+
    // Compute Programming Unit Cost per Engineering Month
    //-
    
    programmingUnitCostPerEm = computeProgrammingUnitCostPerEm(avgBurdenedLaborRate, programmingProductivity: programmingProductivity)
    returnValues.insert(("OutputIndex25", Double(Int(programmingUnitCostPerEm)), nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Team Cost per Engineering Month
    //-
    
    teamCostPerEm = computeTeamCostPerEm(avgBurdenedLaborRate, teamSize: projectTeamSize )
    returnValues.insert(("OutputIndex29b", Double(Int(teamCostPerEm)), nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute # of Defects Leaked to Users per Engineering Month
    //-
    
    numDefectsLeakedToUsers = computeNumDefectsLeakedToUsers(numInjectedDefectsPerEm, dd: dd, qd: qd)
    returnValues.insert(("OutputIndex20", numDefectsLeakedToUsers, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Project Duration in Months
    //-
    
    if let projectDuration = computeProjectDurationInMonths(totalProjectEffort, teamSize: projectTeamSize) {
        projectDurationInMonths = projectDuration
        returnValues.insert(("OutputIndex29", floorOrCeiling(projectDurationInMonths), nil), at: metricIndex)
        metricIndex += 1
        
        returnValues.insert(("OutputIndex4j", floorOrCeiling(projectDurationInMonths), nil), at: metricIndex)
        metricIndex += 1
        
    } else {
        return nil
    }
    
    
    //+
    // Compute Project and Phase Efforts in Staff Engineering Months (Staff-Em)
    //-
    
    (projectEffort, requirementsEffort, designEffort, codeEffort, testEffort) = computeProjectAndPhaseEfforts(projectTeamSize, projectEffortInMonths: projectDurationInMonths)
    
    returnValues.insert(("OutputIndex28a", projectEffort, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28b", requirementsEffort, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28c", designEffort, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28d", codeEffort, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28e", testEffort, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Project and Phase Staffing
    //-
    
    (projectStaffing, requirementsPhaseStaffing, designPhaseStaffing, codePhaseStaffing, testPhaseStaffing) = computeProjectAndPhaseStaffing(projectTeamSize)
    
    returnValues.insert(("OutputIndex28f", projectStaffing, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28g", requirementsPhaseStaffing, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28h", designPhaseStaffing, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28i", codePhaseStaffing, nil), at: metricIndex)
    metricIndex += 1
    
    returnValues.insert(("OutputIndex28j", testPhaseStaffing, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Design, Code, Unit Test (DCUT) Cost
    //-
    
    totalDCUTCost = computeDCUTCost(numFp, numWorkHoursPerFp: numWorkHoursPerFp, avgBurdenedLaborRate: avgBurdenedLaborRate)
    returnValues.insert(("OutputIndex29a", totalDCUTCost, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Total Development Cost
    //-
    
    totalDevelopmentCost = computeTotalDevelopmentCost(projectDurationInMonths, teamCostPerEm: teamCostPerEm   )
    returnValues.insert(("OutputIndex30", Double(Int(totalDevelopmentCost)), nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Hack for Executive Summary:  Compute the Total Project Cost
    //-
    
    returnValues.insert(("OutputIndex4i", floorOrCeiling((1.0 + maintenanceCostPercent) * totalDevelopmentCost), nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Lifetime Maintenance Costs
    //-
    
    lifetimeMaintenanceCost = computeLifetimeMaintenanceCost(totalDevelopmentCost)
    
    returnValues.insert(("OutputIndex30a", lifetimeMaintenanceCost, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Total Project Cost
    //-
    
    totalProjectCost = computeTotalProjectCost(totalDevelopmentCost, lifetimeMaintenanceCost: lifetimeMaintenanceCost)
    
    returnValues.insert(("OutputIndex30b", totalProjectCost, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Find and Fix Percentage of Total Project Effort (Cost of Quality)
    //-
    
    if let findFixPercentage = computeFindFixPercentageOfTotalCostsDueToDefects(projectFindDefectEffort, reworkEffort: projectReworkEffort, totalProjectEffort: totalProjectEffort) {
        findFixPercent = findFixPercentage
        returnValues.insert(("OutputIndex28", findFixPercent, nil), at: metricIndex)
        metricIndex += 1
        
        returnValues.insert(("OutputIndex4h", findFixPercentage, nil), at: metricIndex)
        metricIndex += 1
        
    } else {
        return nil
    }
    
    
    //+
    // Compute Costs Due to Find and Fix Defects (Cost of Quality)
    //-
    
    findFixCostDueToDefects = computeCostDueToFindAndFixDefects(projectFindDefectEffort, reworkEffort: projectReworkEffort, avgBurdenedLaborRate: avgBurdenedLaborRate)
    returnValues.insert(("OutputIndex29c", findFixCostDueToDefects, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Technical Debt
    //-
    
    technicalDebt = computeTechnicalDebt(cmmiMaturityLevel: finalCmmiMaturityLevel)
    returnValues.insert(("OutputIndex29d", technicalDebt, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Cost Effectiveness Indicator
    //-
    
    costEffectivenessIndicator = computeCostEffectivenessIndicator(projectAvgAnnualSalary, teamSize: projectTeamSize, ncSloc: projectNcSloc, devEffort: projectDevEffort, issueCount: projectIssueCount, reworkEffort: projectReworkEffort)
    returnValues.insert(("OutputIndex31", costEffectivenessIndicator, nil), at: metricIndex)
    metricIndex += 1
    
    
    //+
    // Compute Executive Dashboard
    //-
    
    if let executiveDashboardMetrics = computeExecutiveDashboardMetrics(finalCmmiMaturityLevel, qualityIndex: qualityIndex, costEffectivenessIndicator: costEffectivenessIndicator, defectRemovalEffectiveness: 100.0 * defectRemovalEffectiveness) {
        executiveDashboardProductivity = executiveDashboardMetrics.0
        returnValues.insert(("OutputIndex01", executiveDashboardProductivity, nil), at: metricIndex)
        metricIndex += 1
        
        executiveDashboardQuality = executiveDashboardMetrics.1
        returnValues.insert(("OutputIndex02", executiveDashboardQuality, nil), at: metricIndex)
        metricIndex += 1
        
        executiveDashboardCostEffectiveness = executiveDashboardMetrics.2
        returnValues.insert(("OutputIndex03", executiveDashboardCostEffectiveness, nil), at: metricIndex)
        metricIndex += 1
        
        executiveDashboardSoftwareProcessEffectiveness = executiveDashboardMetrics.3
        returnValues.insert(("OutputIndex04", executiveDashboardSoftwareProcessEffectiveness, nil), at: metricIndex)
        metricIndex += 1
    } else {
        return nil
    }
    
    
    //+
    // Compute Project Risk Factors
    //-
    
    if let riskFactors = computeRiskFactors(numFp) {
        projectFailureRisk = riskFactors.0
        returnValues.insert(("OutputIndex04a", floorOrCeiling(100.0 * projectFailureRisk), nil), at: metricIndex)
        metricIndex += 1
        
        projectDelayRisk = riskFactors.1
        returnValues.insert(("OutputIndex04b", floorOrCeiling(100.0 * projectDelayRisk), nil), at: metricIndex)
        metricIndex += 1
        
        projectPoorQualityRisk = riskFactors.2
        returnValues.insert(("OutputIndex04c", floorOrCeiling(100.0 * projectPoorQualityRisk), nil), at: metricIndex)
        metricIndex += 1
        
    } else {
        
        return nil
    }
    
    
    //+
    // Compute Project Outcome Probabilities
    //-
    
    if let outcomeFactors = computeProjectOutcomeFactors(numFp) {
        projectOutcomeEarly = outcomeFactors.0
        returnValues.insert(("OutputIndex4d", floorOrCeiling(100.8 * projectOutcomeEarly), nil), at: metricIndex)
        metricIndex += 1
        
        projectOutcomeOntime = outcomeFactors.1
        returnValues.insert(("OutputIndex4e", floorOrCeiling(100.0 * projectOutcomeOntime), nil), at: metricIndex)
        metricIndex += 1
        
        projectOutcomeDelayed = outcomeFactors.2
        returnValues.insert(("OutputIndex4f", floorOrCeiling(100.0 * projectOutcomeDelayed), nil), at: metricIndex)
        metricIndex += 1
        
        projectOutcomeCanceled = outcomeFactors.3
        returnValues.insert(("OutputIndex4g", floorOrCeiling(100.0 * projectOutcomeCanceled), nil), at: metricIndex)
        metricIndex += 1
        
    } else {
        
        return nil
    }
    
    
    //+
    // Compute Agile Invested Cost Savings Using Real Options Analysis
    //-
    
    roa = computeRealOptionsAnalysis(totalDevelopmentCost, finalCmmiMaturityLevel: finalCmmiMaturityLevel, averageRisk: (projectFailureRisk + projectDelayRisk + projectPoorQualityRisk) / 3.0)
    returnValues.insert(("OutputIndex30c", roa, nil), at: metricIndex)
    metricIndex += 1
    
    
    return returnValues
    
} // end computeMetrics



func computeMetrics(_ outputValues: [(String, Double?, String?)]) -> [String : String] {
    
    var ans = [String: String]()
    
    for tuple in outputValues {
        
        switch "\(tuple.0)" {
            
        case "OutputIndex00":
            ans["ProjectId"] = tuple.2!
            
        case "OutputIndex01":
            ans["Project Productivity"] = String(format:"%1.0f", tuple.1!)
            
        case "OutputIndex02":
            ans["Software Quality"] = String(format:"%1.0f", tuple.1!)
            
        case "OutputIndex03":
            ans["Project Cost Effectiveness"] = String(format:"%1.0f", tuple.1!)
            
        case "OutputIndex04":
            ans["Development Process Effectiveness"] = String(format:"%1.0f", tuple.1!)
            
        case "OutputIndex04a":
            ans["Est Project Failure Risk"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex04b":
            ans["Est Project Delay Risk"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex04c":
            ans["Est Software Poor Quality Risk"] = String(format:"%3.0f", tuple.1!) + "%"

        case "OutputIndex4d":
            ans["Est Complete Early"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex4e":
            ans["Est Complete On-Time"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex4f":
            ans["Est Complete Delayed"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex4g":
            ans["Est Complete Canceled"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex4h":
            ans["Est Cost of Quality"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex4i":
            ans["Est Total Project Cost"] = tuple.1!.toMoney(toLength: 10)
            
        case "OutputIndex4j":
            ans["Est Project Duration"] = String(format:"%3.1f", tuple.1!) + " Ems"
            
            
        case "OutputIndex05":
            print("*****************************", terminator: "")
            print("DERIVED-PROJECT INPUTS:      ", terminator: "")
            print("*****************************", terminator: "")
            print("ProjectId:", terminator: "")
            print("     \(tuple.2!)", terminator: "")
            
        case "OutputIndex06":
            ans["Project Team Size"] = String(format:"%4.0f", tuple.1!)
            
        case "OutputIndex07":
            ans["Labor Rate"] = "$" + String(format:"%3.0f", tuple.1!)
            
        case "OutputIndex08":
            ans["Total Project Hours"] = String(format:"%11.0f", tuple.1!) + " Ehrs"
            
        case "OutputIndex08a":
            ans["Development Effort Percent"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex08b":
            ans["Test Effort Percent"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex09":
            ans["Programming Language"] = tuple.2!
            
        case "OutputIndex09a":
            ans["Programming Language Level"] = String(format:"%2.0f", tuple.1!)
            
        case "OutputIndex10":
            ans["NumNcnbSloc"] = String(format:"%9.0f", tuple.1!)
            
        case "OutputIndex10a":
            ans["Number of Issues"] = String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex10b":
            ans["Est Number of Severity 1 Issues"] = String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex10c":
            ans["Est Number of Severity 2 Issues"] = String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex10d":
            ans["Est Number of Severity 3 Issues"] = String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex10e":
            ans["Est Number of Severity 4 Issues"] = String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex11":
            ans["CMMI Maturity Level"] = String(format:"%1.0f", tuple.1!)
            
        case "OutputIndex12":
            ans["Programming Productivity"] = String(format:"%4.0f", tuple.1!) + " NcSloc per SE per Em"
            
        case "OutputIndex13":
            ans["Est PreRelease Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14":
            ans["Est PostRelease Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex140a":
            ans["Est Expected Delivered Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14a":
            ans["Est PreRelease Requirements Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14b":
            ans["Est PreRelease Design Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14c":
            ans["Est PreRelease Code Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14d":
            ans["Est PreRelease Test Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14e":
            ans["Est PreRelease Documentation Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex14f":
            ans["Est PreRelease Bad-Fix Defects"] = String(format:"%4.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex15":
            ans["Software Defect Density"] = String(format:"%3.0f", tuple.1!) + " Dfs / KncSloc"
            
        case "OutputIndex15a":
            ans["Industry Average Defect Density"] = String(format:"%3.0f", tuple.1!) + " Dfs / KncSloc"
            
        case "OutputIndex16":
            ans["PotentialDfsLeft"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16a":
            ans["Est Requirement Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16b":
            ans["Est Design Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16c":
            ans["Est Code Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16d":
            ans["Est Security Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16e":
            ans["Est User Documentation Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16f":
            ans["Est Test Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex16g":
            ans["Est Bad-Fix Defects Left"] = String(format:"%5.0f", tuple.1!) + " Dfs"
            
        case "OutputIndex17":
            ans["Est Defects per Engineering Month"] = String(format:"%4.0f", tuple.1!) + " Dfs per Em"
            
        case "OutputIndex18":
            ans["Est Software Inspection Productivity"] = String(format:"%4.0f", tuple.1!) + " Dfs per Em"
            
        case "OutputIndex19":
            ans["Est Quality Assurance Productivity"] = String(format:"%4.0f", tuple.1!) + " Dfs per Em"
            
        case "OutputIndex20":
            ans["Est Defects Leaked to Users"] = String(format:"%4.0f", tuple.1!) + " Dfs per Em"
            
        case "OutputIndex21":
            ans["Est Project Defect Removal Efficiency"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex22":
            ans["Est Capability-Based DRE"] = tuple.2!
            
        case "OutputIndex22a":
            ans["Est US Average DRE"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex22b":
            ans["Est US Average DDE"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex23":
            ans["Est Find Fix Effort Per Defect"] = String(format:"%3.1f", tuple.1!) + " Ehs per Dfs"
            
        case "OutputIndex24":
            ans["Est Avg Find Fix Effort per Defect"] = String(format:"%3.1f", tuple.1!) + " Ehs per Dfs"
            
        case "OutputIndex25":
            ans["Est Unit Cost per Engineering Month"] = "$" + String(format:"%3.1f", tuple.1!) + " per NcSloc per Em"
            
        case "OutputIndex28":
            ans["Est Find Fix Percentage"] = String(format:"%3.0f", tuple.1!) + "%"
            
        case "OutputIndex28a":
            ans["Est Project Effort"] = String(format:"%6.0f", tuple.1!) + " Staff-Em"
            
        case "OutputIndex28b":
            ans["Est Requirements Effort"] = String(format:"%6.0f", tuple.1!) + " Staff-Em"
            
        case "OutputIndex28c":
            ans["Est Design Effort"] = String(format:"%6.0f", tuple.1!) + " Staff-Em"
            
        case "OutputIndex28d":
            ans["Est Code Effort"] = String(format:"%6.0f", tuple.1!) + " Staff-Em"
            
        case "OutputIndex28e":
            ans["Est Test Effort"] = String(format:"%6.0f", tuple.1!) + " Staff-Em"
            
        case "OutputIndex28f":
            ans["Est Total Project Staffing"] = String(format:"%3.0f", tuple.1!) + " Staff-Members"
            
        case "OutputIndex28g":
            ans["Est Requirements Staffing"] = String(format:"%3.0f", tuple.1!) + " Staff-Members"
            
        case "OutputIndex28h":
            ans["Est Design Staffing"] = String(format:"%3.0f", tuple.1!) + " Staff-Members"
            
        case "OutputIndex28i":
            ans["Est Coding Staffing"] = String(format:"%3.0f", tuple.1!) + " Staff-Members"
            
        case "OutputIndex28j":
            ans["Est Test Staffing"] = String(format:"%3.0f", tuple.1!) + " Staff-Members"
            
        case "OutputIndex29":
            ans["Est Project Duration"] = String(format:"%3.1f", tuple.1!) + " Ems"
            
        case "OutputIndex29a":
            ans["Est Design, Code & Test Cost"] = "$" + String(format:"%11.0f", tuple.1!)
            
        case "OutputIndex29b":
            ans["Est Team Cost per Engineering Month"] = "$" + String(format:"%11.0f", tuple.1!) + " per Em"
            
        case "OutputIndex29c":
            ans["Est Cost of Quality"] = "$" + String(format:"%11.0f", tuple.1!)
            
        case "OutputIndex29d":
            ans["Est Technical Debt"] = "$" + String(format:"%6.0f", tuple.1!)
            
        case "OutputIndex30":
            ans["Est Total Development Cost"] = "$" + String(format:"%11.0f", tuple.1!)
            
        case "OutputIndex30a":
            ans["Est Lifetime Maintenance Cost"] = "$" + String(format:"%11.0f", tuple.1!)
            
        case "OutputIndex30b":
            ans["Est Total Project Cost"] = "$" + String(format:"%11.0f", tuple.1!)
            
        case "OutputIndex30c":
            ans["Est Agile Invested Savings"] = "$" + String(format:"%9.0f", tuple.1!)
            
        case "OutputIndex31":
            ans["Est Cost-Effectiveness Indicator"] = String(format:"%1.1f", tuple.1!)
            
        default:
            print("Invalid Output Index", terminator: "")
            
        } // end switch
        
    } // end for-in
    
    return ans
}
//
//func computeMetricsString(_ outputValues: [(String, Double?, String?)]) -> [String : String] {
//    let ans = computeMetrics(outputValues)
//
//    var ret = [String : String] ()
//
//    for (key, value) in ans {
//        if value.0 == nil {
//            ret[key] = value.1!
//        } else {
//            ret[key] = String(format: "%f", value.0!)
//        }
//    }
//
//    return ret
//}

