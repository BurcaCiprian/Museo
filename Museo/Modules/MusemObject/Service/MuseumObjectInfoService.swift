//
//  MuseumObjectInfoService.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 10/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation
import Alamofire

final public class MuseumObjectInfoService: MuseumObjectInfoServiceProtocol {
    
    let networkService: NetworkServiceProtocol
    
    public init (_ service: NetworkServiceProtocol = NetworkService()) {
        self.networkService = service
    }
    
    public func getObjectInfo(for objectId: String, completion: @escaping (Result<ObjectInfoResponse?>) -> Void) {
        if let objectInfoUrl = self.objectInfoRequestUrl(for: objectId) {
            networkService.load(url: objectInfoUrl) { (result) in
                if result.isSuccess {
                    if let museumObject = self.handleResponse(result: result) {
                        completion(Result.success(museumObject))
                    }
                    else {
                        completion(Result.failure(AppError.missingData("Museum object not retreived")))
                    }
                }
                else {
                    if result.isFailure, let error = result.error {
                        completion(Result.failure(error))
                    }
                }
            }
        }
        else {
            completion(Result.failure(AppError.missingObject("Object Info URL")))
        }
    }
    
    public func getRandomObjectInfo(hasImage: String, completion: @escaping (Result<ObjectInfoResponse?>) -> Void) {
        if let randomObjectInfoUrl = self.randomObjectInfoRequestUrl(hasImage: hasImage) {
            networkService.load(url: randomObjectInfoUrl) { (result) in
                if result.isSuccess {
                    if let museumObject = self.handleResponse(result: result) {
                        completion(Result.success(museumObject))
                    }
                    else {
                        completion(Result.failure(AppError.missingData("Random museum object not retreived")))
                    }
                }
                else {
                    if result.isFailure, let error = result.error {
                        completion(Result.failure(error))
                    }
                }
            }
        }
        else {
            completion(Result.failure(AppError.missingObject("Random Object Info URL")))
        }
        
    }
    
    public func loadMuseumObjectImage(url: URL, completion: @escaping (Result<Any?>) -> Void) {
        
        networkService.loadImage(url: url) { (result) in
            if result.isSuccess {
                if let image = result.value! {
                    completion(Result.success(image))
                }
                else {
                    completion(Result.failure(AppError.missingData("Image not retreived")))
                }
            }
            else {
                if result.isFailure, let error = result.error {
                    completion(Result.failure(error))
                }
            }
        }
    }
    
    func handleResponse(result: Result<Any?>) -> ObjectInfoResponse? {
        var retObject: ObjectInfoResponse?
        if let initialObject = result.value as? [String: Any] {
            if let museumObject = initialObject["object"] as?  [String: Any] {
                retObject = ObjectInfoResponse(JSON: museumObject)
            }
        }
        return retObject
    }
    
    //func extractImagesArray(objectInfo: ObjectInfoResponse?) -> []
    
    func objectInfoRequestUrl(for objectId: String) -> URL? {
        guard let url = APIConfiguration.objectInfoBaseURL as URL? else {
            return nil
        }
        return appendTo(url: url, key: "object_id", value: objectId)
    }
    
    func randomObjectInfoRequestUrl(hasImage: String) -> URL? {
        guard let url = APIConfiguration.randomObjectInfoBaseURL as URL? else {
            return nil
        }
        return appendTo(url: url, key: "has_image", value: hasImage)
    }
    
    func appendTo(url: URL, key: String, value: String) -> URL? {
        var urlComponents: URLComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.host = APIConfiguration.objectInfoBaseURL!.host
        urlComponents.scheme = APIConfiguration.objectInfoBaseURL!.scheme
        urlComponents.path = APIConfiguration.objectInfoBaseURL!.path
        let queryItemObjectId = URLQueryItem(name: key, value: value)
        urlComponents.queryItems?.append(queryItemObjectId)
        return urlComponents.url
    }
    
}
