//
//  CalculatorTests.swift
//  ElephantCarpaccioTests
//
//  Created by Mahmoud BEN MESSAOUD on 17/03/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import XCTest
@testable import ElephantCarpaccio
class CalculatorTests: XCTestCase {
    let calculator = Calculator()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_calculateTotal_should_return_75_when_quantity_equal_5_And_price_equal_15(){
        //arrage
        let expectedResult = 75.0
        let quantity = 5
        let price = 15.0
        //acte
        let result = calculator.calculateTotal(quantity: quantity, price: price)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateTax_should_return_6_85_when_total_equal_100_and_state_is_UT(){
        //arrage
        let expectedResult = 6.85
        let total = 100.0
        let state = State.ut
        //acte
        let result = calculator.claculateTax(total: total, state: state)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateTax_should_return_8_when_total_equal_100_and_state_is_NV(){
        //arrage
        let expectedResult = 8.0
        let total = 100.0
        let state = State.nv
        //acte
        let result = calculator.claculateTax(total: total, state: state)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateTax_should_return_6_25_when_total_equal_100_and_state_is_NV(){
        //arrage
        let expectedResult = 6.25
        let total = 100.0
        let state = State.tx
        //acte
        let result = calculator.claculateTax(total: total, state: state)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateTax_should_return_4_when_total_equal_100_and_state_is_AL(){
        //arrage
        let expectedResult = 4.0
        let total = 100.0
        let state = State.al
        //acte
        let result = calculator.claculateTax(total: total, state: state)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateTax_should_return_8_25_when_total_equal_100_and_state_is_CA(){
        //arrage
        let expectedResult = 8.25
        let total = 100.0
        let state = State.ca
        //acte
        let result = calculator.claculateTax(total: total, state: state)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_0_when_total_equal_1(){
        //arrage
        let expectedResult = 0.0
        let total = 1.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_0_when_total_equal_1000(){
        //arrage
        let expectedResult = 0.0
        let total = 1000.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_30_03_when_total_equal_1001(){
        //arrage
        let expectedResult = 30.03
        let total = 1001.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_150_when_total_equal_5000(){
        //arrage
        let expectedResult = 150.0
        let total = 5000.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_250_05_when_total_equal_5001(){
        //arrage
        let expectedResult = 250.05
        let total = 5001.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_350_when_total_equal_7000(){
        //arrage
        let expectedResult = 350.0
        let total = 7000.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_490_07_when_total_equal_7001(){
        //arrage
        let expectedResult = 490.07
        let total = 7001.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_700_when_total_equal_10000(){
        //arrage
        let expectedResult = 700.0
        let total = 10000.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_1000_01_when_total_equal_10001(){
        //arrage
        let expectedResult = 1000.1
        let total = 10001.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_1500_when_total_equal_50000(){
        //arrage
        let expectedResult = 5000.0
        let total = 50000.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateDiscount_should_return_7500_15_when_total_equal_50001(){
        //arrage
        let expectedResult = 7500.15
        let total = 50001.0
        //acte
        let result = calculator.calculateDiscount(total: total)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculateFinalPrice_should_return_9000_when_total_1000_tax_100_discount_200(){
        //arrage
        let expectedResult = 900.0
        let total = 1000.0
        let tax = 100.0
        let discount = 200.0
        //acte
        let result = calculator.calculateFinalPrice(total: total, totalTax: tax, discount: discount)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
}
