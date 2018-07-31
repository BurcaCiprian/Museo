//
//  ArtPeriod+CoreDataProperties.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 05/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//
//

import Foundation
import CoreData


extension ArtPeriod {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArtPeriod> {
        return NSFetchRequest<ArtPeriod>(entityName: "ArtPeriod")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var desc: String?

}
