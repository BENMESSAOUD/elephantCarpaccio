//
//  ItemValidatorTests.swift
//  ElephantCarpaccioTests
//
//  Created by Mahmoud BEN MESSAOUD on 17/03/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import XCTest
@testable import ElephantCarpaccio

class ItemValidatorTests: XCTestCase {
    let validator = ItemValidator()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_validateLabel_should_return_false_when_value_is_Empty(){
        //arrage
        let value = ""
        //acte
        let result = validator.validateLabel(value)
        //assert
        XCTAssertFalse(result)
    }
    
    func test_validateLabel_should_return_false_when_value_is_not_Empty(){
        //arrage
        let value = "Abc"
        //acte
        let result = validator.validateLabel(value)
        //assert
        XCTAssertTrue(result)
    }
    
    func test_validateQuantity_should_return_false_when_value_is_negative(){
        //arrage
        let value = -2
        //acte
        let result = validator.validateQuantity(value)
        //assert
        XCTAssertFalse(result)
    }
    
    func test_validateQuantity_should_return_false_when_value_is_positive(){
        //arrage
        let value = 2
        //acte
        let result = validator.validateQuantity(value)
        //assert
        XCTAssertTrue(result)
    }
    
    func test_validatePrice_should_return_false_when_value_is_negative(){
        //arrage
        let value = -2.0
        //acte
        let result = validator.validatePrice(value)
        //assert
        XCTAssertFalse(result)
    }
    
    func test_validatePrice_should_return_false_when_value_is_positive(){
        //arrage
        let value = 2.0
        //acte
        let result = validator.validatePrice(value)
        //assert
        XCTAssertTrue(result)
    }
}
