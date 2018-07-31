//
//  ObjectType+CoreDataProperties.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 05/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//
//

import Foundation
import CoreData


extension ObjectType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ObjectType> {
        return NSFetchRequest<ObjectType>(entityName: "ObjectType")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var typetoobject: NSSet?

}

// MARK: Generated accessors for typetoobject
extension ObjectType {

    @objc(addTypetoobjectObject:)
    @NSManaged public func addToTypetoobject(_ value: MuseumObject)

    @objc(removeTypetoobjectObject:)
    @NSManaged public func removeFromTypetoobject(_ value: MuseumObject)

    @objc(addTypetoobject:)
    @NSManaged public func addToTypetoobject(_ values: NSSet)

    @objc(removeTypetoobject:)
    @NSManaged public func removeFromTypetoobject(_ values: NSSet)

}
