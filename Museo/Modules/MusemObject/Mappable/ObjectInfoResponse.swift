//
//  ObjectInfoResponse.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 09/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation
import ObjectMapper

public class ObjectInfoResponse: Mappable {
    
    var id: String?
    var medium: String?
    var provenance: String?
    var dimensions: String?
    var description: String?
    var type: String?
    var typeId: String?
    var images: Array<Dictionary<String, Dictionary<String, Any>>>?
    var title: String?
    var department: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        medium      <- map["medium"]
        provenance  <- map["provenance"]
        dimensions  <- map["dimensions"]
        description <- map["description"]
        type        <- map["type"]
        typeId      <- map["type_id"]
        images      <- map["images"]       
        title       <- map["title"]
        department  <- map["department"]
    }
}

