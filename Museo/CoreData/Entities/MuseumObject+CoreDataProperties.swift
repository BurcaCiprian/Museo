//
//  MuseumObject+CoreDataProperties.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 05/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//
//

import Foundation
import CoreData


extension MuseumObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MuseumObject> {
        return NSFetchRequest<MuseumObject>(entityName: "MuseumObject")
    }

    @NSManaged public var id: Int16
    @NSManaged public var type: Int16
    @NSManaged public var period: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var objecttotype: ObjectType?

}
