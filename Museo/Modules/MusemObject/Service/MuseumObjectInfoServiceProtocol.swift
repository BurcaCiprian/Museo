//
//  MuseumObjectServiceProtocol.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 10/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation
import Alamofire

public protocol MuseumObjectInfoServiceProtocol {
    
    // Fetch a single ObjectInfoResponse
    func getObjectInfo(for objectId: String, completion: @escaping(Result<ObjectInfoResponse?>) -> Void)
    
    // Fetch a random MuseumObject as a ObjectInfoResponse
    func getRandomObjectInfo(hasImage: String, completion: @escaping(Result<ObjectInfoResponse?>) -> Void)
    
    // Fetch an image from a specified URL
    func loadMuseumObjectImage(url: URL, completion: @escaping(Result<Any?>) -> Void)
    
}
