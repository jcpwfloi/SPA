//
//  Input+CoreDataProperties.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-28.
//
//

import Foundation
import CoreData


extension Input {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Input> {
        return NSFetchRequest<Input>(entityName: "Input")
    }

    @NSManaged public var projectId: String?
    @NSManaged public var projectProgrammingLanguage: String?
    @NSManaged public var projectAvgAnnualSalary: Double
    @NSManaged public var projectTeamSize: Float
    @NSManaged public var projectNcSloc: Double
    @NSManaged public var projectReqDesEffort: Float
    @NSManaged public var projectDevEffort: Double
    @NSManaged public var projectFindDefectEffort: Double
    @NSManaged public var projectReworkEffort: Double
    @NSManaged public var projectIssueCount: Double
    @NSManaged public var projectPostReleaseIndicator: String?

}
