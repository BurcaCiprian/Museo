//
//  GenericService.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 10/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

public class NetworkService: NetworkServiceProtocol {
    
    public init() {
    }
    
    public func load(url: URL, completion: @escaping (Result<Any?>) -> Void) {
        let request = Alamofire.request(url)
        request.validate()
        request.responseJSON { response in
            switch response.result {
                case .success:
                    completion(Result.success(response.result.value))
                case .failure(let error):
                    print(error)
                    completion(Result.failure(error))
            }
        }
    }
    
    public func loadImage(url: URL, completion: @escaping (Result<Any?>) -> Void) {
        let request = Alamofire.request(url)
        request.validate()
        request.responseImage { response in
            switch response.result {
                case .success:
                    completion(Result.success(response.result.value))
                case .failure(let error):
                    print(error)
                    completion(Result.failure(error))
            }
        }
    }
}
