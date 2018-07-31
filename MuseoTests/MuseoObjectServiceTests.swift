//
//  MuseoTests.swift
//  MuseoTests
//
//  Created by Victor Ciprian Burca on 05/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import Museo

class MuseoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetMuseumObjectSuccess() {
        
        stub(condition: isHost("api.collection.cooperhewitt.org")) { request in
            // Stub it with our "18453305.json" stub file
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("18453305.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        
        let objectService = MuseumObjectInfoService()
        let expectation = self.expectation(description: "Calls the API to get some object info.")
        
        objectService.getObjectInfo(for: "18453305") { (response) in
            
            XCTAssertNil(response.error)
            XCTAssertNotNil(response.value!)
            
            let mockedObject = response.value as? ObjectInfoResponse
            
            XCTAssertTrue(response.isSuccess)
            XCTAssertFalse(response.isFailure)
            
            XCTAssertNotNil(mockedObject)
            XCTAssertEqual(mockedObject!.dimensions!, "47 x 75.5 cm (18 1/2 x 29 3/4 in.)")
            XCTAssertEqual(mockedObject!.id!, "18453305")
            XCTAssertEqual(mockedObject!.type!, "Sidewall")
            XCTAssertEqual(mockedObject!.typeId!, "35256475")
            XCTAssertEqual(mockedObject!.title!, "Sidewall, Kent, 1965")
            XCTAssertEqual(mockedObject!.medium!, "screen printed")
            XCTAssertEqual(mockedObject!.description!, "On gray ground, ornate shaded scrollwork in shades of gray and white forming small cartouches enframing bouquets of white roses with bright green leaves. Printed in margin: \"Scalamandre Wallpaper\".")
            
            XCTAssertNil(mockedObject!.department)
            XCTAssertNil(mockedObject!.provenance)
            
            //test image urls
            
            print(mockedObject!.images![0]["b"]!["url"]!)
            
            XCTAssertNotNil(mockedObject!.images)
            XCTAssertEqual(mockedObject!.images![0]["b"]!["url"] as! String, "https://images.collection.cooperhewitt.org/265247_088a5d562a581c7d_b.jpg")
            XCTAssertEqual(mockedObject!.images![0]["b"]!["width"] as! Int, 1024)
            XCTAssertEqual(mockedObject!.images![0]["sq"]!["url"] as! String, "https://images.collection.cooperhewitt.org/265247_088a5d562a581c7d_sq.jpg")
            XCTAssertEqual(mockedObject!.images![0]["sq"]!["width"] as! Int, 300)
            XCTAssertEqual(mockedObject!.images![0]["d"]!["url"] as! String, "https://images.collection.cooperhewitt.org/265247_088a5d562a581c7d_d.gif")
            XCTAssertEqual(mockedObject!.images![0]["d"]!["width"] as! Int, 320)
            XCTAssertEqual(mockedObject!.images![0]["z"]!["url"] as! String, "https://images.collection.cooperhewitt.org/265247_088a5d562a581c7d_z.jpg")
            XCTAssertEqual(mockedObject!.images![0]["z"]!["width"] as! Int, 640)

            let stubImagePath = OHPathForFile("265247_088a5d562a581c7d_b.jpg", type(of: self))
            
            stub(condition: isExtension("jpg")) { request in
               return fixture(filePath: stubImagePath!, headers: ["Content-Type":"image/jpeg"])
                    .requestTime(0.0, responseTime: OHHTTPStubsDownloadSpeedWifi)
            }
            
            objectService.loadMuseumObjectImage(url: URL(string: "https://images.collection.cooperhewitt.org/265247_088a5d562a581c7d_b.jpg")!, completion: { (result) in
                XCTAssertNotNil(result)
                XCTAssertNotNil(result.value!)
                XCTAssert(result.value! is UIImage)
                expectation.fulfill()
            })
        }
        
        self.waitForExpectations(timeout: 3.3, handler: .none)
        
        // Tear Down
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetRandomMuseumObjectSuccess() {
        
        stub(condition: isHost("api.collection.cooperhewitt.org")) { request in
            // Stub it with our "18453305.json" stub file
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("18453305.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        
        let objectService = MuseumObjectInfoService()
        let expectation = self.expectation(description: "Calls the API to a random object.")
        
        objectService.getRandomObjectInfo(hasImage: "1") { (response) in
            
            XCTAssertNil(response.error)
            XCTAssertNotNil(response.value!)
            
            let mockedObject = response.value as? ObjectInfoResponse
            
            XCTAssertTrue(response.isSuccess)
            XCTAssertFalse(response.isFailure)
            
            XCTAssertNotNil(mockedObject)
            XCTAssertEqual(mockedObject!.dimensions!, "47 x 75.5 cm (18 1/2 x 29 3/4 in.)")
            XCTAssertEqual(mockedObject!.id!, "18453305")
            XCTAssertEqual(mockedObject!.type!, "Sidewall")
            XCTAssertEqual(mockedObject!.typeId!, "35256475")
            XCTAssertEqual(mockedObject!.title!, "Sidewall, Kent, 1965")
            XCTAssertEqual(mockedObject!.medium!, "screen printed")
            XCTAssertEqual(mockedObject!.description!, "On gray ground, ornate shaded scrollwork in shades of gray and white forming small cartouches enframing bouquets of white roses with bright green leaves. Printed in margin: \"Scalamandre Wallpaper\".")
            
            XCTAssertNil(mockedObject!.department)
            XCTAssertNil(mockedObject!.provenance)
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.3, handler: .none)
        
        // Tear Down
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetMuseumObjectInfoServiceURLs() {
        let objectService = MuseumObjectInfoService()
        
        let url = objectService.objectInfoRequestUrl(for: "18453305")
        XCTAssertNotNil(url)
        XCTAssertEqual(url!.absoluteString,
                       "https://api.collection.cooperhewitt.org/rest?access_token=8186dfc1892085db38d55b340fe13551&method=cooperhewitt.objects.getInfo&object_id=18453305")
        
        let urlRandom = objectService.randomObjectInfoRequestUrl(hasImage: "1")
        XCTAssertNotNil(urlRandom)
        XCTAssertEqual(urlRandom!.absoluteString,
                       "https://api.collection.cooperhewitt.org/rest?access_token=8186dfc1892085db38d55b340fe13551&method=cooperhewitt.objects.getRandom&has_image=1")
        
        let someURL = objectService.appendTo(url: urlRandom!, key: "TestKey", value: "TestValue")
        XCTAssertNotNil(someURL)
        XCTAssertEqual(someURL!.absoluteString,
                       "https://api.collection.cooperhewitt.org/rest?access_token=8186dfc1892085db38d55b340fe13551&method=cooperhewitt.objects.getRandom&has_image=1&TestKey=TestValue")
    }

    
    func testGetMuseumObjectFailure() {
        
        stub(condition: isHost("api.collection.cooperhewitt.org")) { _ in
            let stubData = "Invalid JSON response".data(using: String.Encoding.utf8)
            return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
        }
  
        let objectService = MuseumObjectInfoService()
        let expectation1 = self.expectation(description: "Calls the API to get some object info. Gets invalid response. Should fail")
        
        objectService.getObjectInfo(for: "18453305") { (response) in
            
            XCTAssertNotNil(response.error)
            
            XCTAssertFalse(response.isSuccess)
            XCTAssertTrue(response.isFailure)
            
            XCTAssertEqual(response.error!.localizedDescription,
                           "JSON could not be serialized because of error:\nThe data couldn’t be read because it isn’t in the correct format.")
            
            expectation1.fulfill()
        }
        
        self.waitForExpectations(timeout: 1.3, handler: .none)
        
        // Tear Down
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetMuseumObjectEmptyJsonFailure() {
        // test emtpy json
        let expectation = self.expectation(description: "Calls the API to get some object info. Gets empty json. Should fail")
        stub(condition: isHost("api.collection.cooperhewitt.org")) { request in
            // Stub it with our "18453305.json" stub file
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("empty.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        
        let objectService = MuseumObjectInfoService()
       
        objectService.getObjectInfo(for: "18453305") { (response) in

            XCTAssertNotNil(response.error)

            XCTAssertFalse(response.isSuccess)
            XCTAssertTrue(response.isFailure)

            XCTAssertEqual(response.error!.localizedDescription,
                           "Museum object not retreived")

            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 1.3, handler: .none)
        
        // Tear Down
        OHHTTPStubs.removeAllStubs()
    }
    
    func testNoNetwork() {
        
        stub(condition: isHost("api.collection.cooperhewitt.org")) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue)
            return OHHTTPStubsResponse(error:notConnectedError)
        }
        
        let objectService = MuseumObjectInfoService()
        let expectation = self.expectation(description: "Calls the API to get some object info. No network. Should fail.")
        
        objectService.getObjectInfo(for: "18453305") { (response) in
            
            XCTAssertNotNil(response.error)
            XCTAssertNil(response.value)
            XCTAssertFalse(response.isSuccess)
            XCTAssertTrue(response.isFailure)
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.3, handler: .none)
        
        // Tear Down
        OHHTTPStubs.removeAllStubs()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
