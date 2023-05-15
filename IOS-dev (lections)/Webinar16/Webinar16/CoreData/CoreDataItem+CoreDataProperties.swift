//
//  CoreDataItem+CoreDataProperties.swift
//  Webinar16
//
//  Created by Bitec mini on 18.04.2023.
//
//

import Foundation
import CoreData


extension CoreDataItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataItem> {
        return NSFetchRequest<CoreDataItem>(entityName: "CoreDataItem")
    }

    @NSManaged public var sTitle: String?
    @NSManaged public var isCompleted: Bool

}

extension CoreDataItem : Identifiable {

}
