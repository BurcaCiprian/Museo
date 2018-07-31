//
//  APIConfiguration.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 10/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation

public class APIConfiguration {
    
    public static var accessToken: String = "8186dfc1892085db38d55b340fe13551"
    public static var baseUrl: String = "https://api.collection.cooperhewitt.org"
    
    public static var objectInfoBaseURL: URL? {
        let url = URL(string: baseUrl + "/rest")!
        var comps = URLComponents()
        comps.host = url.host
        comps.scheme = url.scheme
        comps.path = url.path
        comps.queryItems = objectInfoQueryItems
        return comps.url
    }
    
    public static var randomObjectInfoBaseURL: URL? {
        let url = URL(string: baseUrl + "/rest")!
        var comps = URLComponents()
        comps.host = url.host
        comps.scheme = url.scheme
        comps.path = url.path
        comps.queryItems = randomObjectInfoQueryItems
        return comps.url
    }
    
}

extension APIConfiguration {
    
    static var objectInfoQueryItems: [URLQueryItem] {
        var items = baseQueryItems
        items.append(URLQueryItem(name: "method", value: "cooperhewitt.objects.getInfo"))
        return items
    }
    
    static var randomObjectInfoQueryItems: [URLQueryItem] {
        var items = baseQueryItems
        items.append(URLQueryItem(name: "method", value: "cooperhewitt.objects.getRandom"))
        return items
    }
    
    static var baseQueryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "access_token", value: accessToken))
        return items
    }

}
