//
//  Gathering+CoreDataProperties.swift
//  CMP1000-AMS-IOS
//
//  Created by REKELL CARAAN on 2022-12-16.
//
//

import Foundation
import CoreData


extension Gathering {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gathering> {
        return NSFetchRequest<Gathering>(entityName: "Gathering")
    }

    @NSManaged public var id: Int16
    @NSManaged public var label: String?
    @NSManaged public var schedule: Date?
    @NSManaged public var delivery: String?
    @NSManaged public var remarks: String?

}

extension Gathering : Identifiable {

}
