//
//  Users+CoreDataProperties.swift
//  CMP1000-AMS-IOS
//
//  Created by REKELL CARAAN on 2022-12-16.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var role: String?

}

extension Users : Identifiable {

}
