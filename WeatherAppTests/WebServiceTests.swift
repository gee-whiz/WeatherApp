//
//  WebServiceTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 2.2.2023.
//

import XCTest
@testable import WeatherApp
import OHHTTPStubs

final class WebServiceTests: XCTestCase {

    var webService: WebService!
     
     override func setUp() {
         super.setUp()
         webService = WebService()
     }
     
     func testRequest() {
   
         stub(condition: isHost("mywebservice.com")) { _ in
           let obj = ["maxtemp_c": -1.0, "mintemp_c": 9.1]
           return HTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
         }
         
         let endpoint = "https://mywebservice.com"
         let method = "GET"
         
         let expectation = self.expectation(description: "Wait for response")
         
         webService.request(endpoint: endpoint, method: method, parameters: nil) { (result: Result<Day, Error>) in
             switch result {
             case .success(let day):
                 XCTAssertNotNil(day)
                 expectation.fulfill()
             case .failure(let error):
                 XCTFail("Request failed with error: \(error)")
             }
         }
         
         waitForExpectations(timeout: 5, handler: nil)
     }

}
