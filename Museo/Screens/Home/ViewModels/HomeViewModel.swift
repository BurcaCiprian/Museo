//
//  HomeViewModel.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 12/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    let apiService: MuseumObjectInfoServiceProtocol
    
    private var objectOfTheDay: ObjectInfoResponse?
    
    init(apiService: MuseumObjectInfoServiceProtocol = MuseumObjectInfoService()) {
        self.apiService = apiService
    }

}
