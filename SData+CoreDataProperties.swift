//
//  SData+CoreDataProperties.swift
//  core_data_test
//
//  Created by Work on 2023/07/15.
//
//

import Foundation
import CoreData


extension SData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SData> {
        return NSFetchRequest<SData>(entityName: "SData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var time: Date?

}

extension SData : Identifiable {

}
