//
//  Constants.swift
//  SPA
//
//  Created by Jingyuan Chen on 11/19/20.
//

import Foundation

//+
// v**********************************************************************************v
// v*************************** BEGIN GLOBAL DECLARATIONS ****************************v
// v**********************************************************************************v
//-

//+
// Average Annual Salary Including Bonus & Benefits for a Team Member (Software, QA and Documentation Engineers)
//-

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

//+
// Validation Tags
//-

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

//the derived input screen output fields
let derivedInputTags = ["Project Name","Project Team Size", "Labor Rate","Total Project Hours", "Development Effort Percent", "Test Effort Percent", "Programming Language Level","NumNcnbSloc", "Number of Issues","Est Number of Severity 1 Issues","Est Number of Severity 2 Issues","Est Number of Severity 3 Issues","Est Number of Severity 4 Issues"]

//the executive screen output fields
let executiveTags = ["Project Name", "Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Software Poor Quality Risk", "Est Complete Early", "Est Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Duration"]

//the management screen output fields
let managementTags = ["Project Name","Project Productivity", "Software Quality", "Project Cost Effectiveness", "Development Process Effectiveness", "Est Project Failure Risk", "Est Project Delay Risk", "Est Software Poor Quality Risk", "Est Complete Early", "Est Complete On-Time", "Est Complete Delayed", "Est Complete Canceled", "Est Cost of Quality", "Est Total Project Cost", "Est Project Duration"]

//the practitioner screen output fields
let practionerTags = ["Programming Productivity", "Est PreRelease Defects", "Est PostRelease Defects", "Est Expected Delivered Defects", "Est PreRelease Design Defects", "Est PreRelease Code Defects", "Est PreRelease Test Defects", "Est PreRelease Documentation Defects", "Est PreRelease Bad-Fix Defects", "Software Defect Density", "Industry Average Defect Density", "Est Requirement Defects Left", "Est Design Defects Left", "Est Code Defects Left", "Est Security Defects Left", "Est User Documentation Defects Left", "Est Test Defects Left", "Est Bad-Fix Defects Left", "Est Defects per Engineering Month", "Est Software Inspection Productivity", "Est Quality Assurance Productivity", "Est Defects Leaked to Users", "Est Project Defect Removal Efficiency", "Est Capability-Based DRE", "Est US Average DRE", "Est US Average DDE", "Est Find Fix Effort Per Defect", "Est Avg Find Fix Effort per Defect", "Est Unit Cost per Engineering Month", "Est Find Fix Percentage", "Est Project Effort", "Est Requirements Effort", "Est Design Effort", "Est Code Effort", "Est Test Effort", "Est Total Project Staffing", "Est Requirements Staffing", "Est Design Staffing", "Est Coding Staffing", "Est Test Staffing", "Est Project Duration", "Est Design, Code & Test Cost", "Est Team Cost per Engineering Month", "Est Cost of Quality", "Est Technical Debt", "Est Total Development Cost", "Est Lifetime Maintenance Cost", "Est Total Project Cost", "Est Agile Invested Savings"]

//the units of the rawinputs, currently unused
let rawInputUnits = ["", "", " in US$", " Staff Persons", " NcSloc", " Ehrs", " Ehrs", " Ehrs", " Ehrs", " Issues", ""]

//the rawinput validation tags
let rawInputValidationTags = [projectNameValidationTag,programmingLanguageValidationTag,inputAvgAnnualSalaryValidationTag,teamSizeValidationTag,ncSlocValidationTag,reqDesEffortValidationTag,devEffortValidationTag,findDefectEffortValidationTag,reworkEffortValidationTag,issueCountValidationTag,postReleaseIndicatorTag]
