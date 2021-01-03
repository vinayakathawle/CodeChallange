//
//  CalculateHeightTests.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import XCTest

class CalculateHeightTests: XCTestCase {

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

    func testLabelHeight() {
       
        let string = "[{\"breeds\":[{\"weight\":{\"imperial\":\"65 - 115\",\"metric\":\"29 - 52\"},\"height\":{\"imperial\":\"24 - 28\",\"metric\":\"61 - 71\"},\"id\":6,\"name\":\"Akita\",\"bred_for\":\"Hunting bears\",\"breed_group\":\"Working\",\"life_span\":\"10 - 14 years\",\"temperament\":\"Docile, Alert, Responsive, Dignified, Composed, Friendly, Receptive, Faithful, Courageous\",\"reference_image_id\":\"BFRYBufpm\"}],\"id\":\"S1_8kx5Nm\",\"url\":\"https://cdn2.thedogapi.com/images/S1_8kx5Nm_1280.jpg\",\"width\":305,\"height\":300}]"
        let data = string.data(using: .utf8)!
        var breeds  = [BreedsList]()        
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode([BreedsList].self, from: data)
            breeds = response
        } catch let error {
            print(error.localizedDescription)
        }
        
        let heigth = LabelHeight.getHeightForBreedName(width: 305, breeds: breeds[0])
        //Success
        XCTAssertEqual(heigth, 23.5, "correct heigth!")
        //Failure
        XCTAssertNotEqual(heigth, 23, "wrong height!")

    }
}
