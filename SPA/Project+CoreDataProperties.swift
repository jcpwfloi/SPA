//
//  Project+CoreDataProperties.swift
//  SPA
//
//  Created by Zhongrui Chen on 2020-10-28.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var name: String?
    @NSManaged public var input: Input?

}

extension Project : Identifiable {

}
