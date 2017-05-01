//
//  AbsolutDrinkServiceTests.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import XCTest
@testable import Mixr

class AbsolutDrinkServiceTests: XCTestCase {
    let subject : AbsolutDrinkService = AbsolutDrinkService()
    let results : [DrinkModel] = [DrinkModel(
        name:"vodka martini",
        ingredients:[],
        partsPerIngredient:[Ingredient:Int](),
        extraInformation:"")]
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidDrink() {
        let asyncExpectation = expectation(description: "networkTest")
        var callData: [DrinkModel]
        callData = []
        
        subject.searchByName(name: "") { (data) in
            asyncExpectation.fulfill()
            callData.append(contentsOf: data)
        }
        
        self.waitForExpectations(timeout: 100.0) { (error) in
            XCTAssertNil(error, "Call didn't finish in time")
            XCTAssert(!callData.isEmpty, "no data was returned")
        }
    }
    
    
    func testInvalidDrink() {
        let asyncExpectation = expectation(description: "networkTest")
        var callData: [DrinkModel]
        callData = []

        subject.searchByName(name: "lol what am I doing?/") { (data) in
            asyncExpectation.fulfill()
            callData.append(contentsOf: data)
        }
        
        self.waitForExpectations(timeout: 100.0) { (error) in
            XCTAssertNil(error, "Call didn't finish in time")
            XCTAssert(callData.isEmpty, "There were drinks returned")
        }
    }
}
