//
//  NData+CoreDataProperties.swift
//  core_data_test
//
//  Created by Work on 2023/07/15.
//
//

import Foundation
import CoreData


extension NData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NData> {
        return NSFetchRequest<NData>(entityName: "NData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var time: Date?

}

extension NData : Identifiable {

}
