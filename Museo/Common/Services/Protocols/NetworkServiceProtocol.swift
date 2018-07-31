//
//  GenericServiceProtocol.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 10/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation
import Alamofire

public protocol NetworkServiceProtocol {
    func load(url: URL, completion: @escaping(Result<Any?>) -> Void)
    func loadImage(url: URL, completion: @escaping(Result<Any?>) -> Void)
}
