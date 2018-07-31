//
//  ImageInfo.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 12/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import UIKit
import ObjectMapper

struct ImageInfo: Mappable {
    
    var url: String?
    var width: String?
    var height: String?
    var isPrimary: String?
    var imageId: String?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        url       <- map["url"]
        width     <- map["width"]
        height    <- map["height"]
        isPrimary <- map["isPrimary"]
        imageId   <- map["imageId"]
    }
}
