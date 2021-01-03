//
//  NetworkManagerTests.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import XCTest

class NetworkManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetBreeds() {
        let networkManager = NetworkManager()
        let aExpectation = expectation(description: "Breeds")
        var breeds: [BreedsList]?
        
        networkManager.performNetworkTask(endpoint: ConfigAPI.breeds(Constants.limit), type: [BreedsList].self) { (response, type, errorMessage) in
            breeds = response
            aExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNotNil(breeds)
        }
    }
    
}
