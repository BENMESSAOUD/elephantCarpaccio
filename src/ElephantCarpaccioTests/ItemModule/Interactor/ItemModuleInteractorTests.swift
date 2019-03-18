//
//  ItemModuleInteractorTests.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import XCTest
@testable import ElephantCarpaccio
class ItemInteractorTests: XCTestCase {
    var interactor :ItemModuleInteractor?
    var presenter: MockPresenter?
    var validator = MockValidator()
    override func setUp() {
        super.setUp()
        interactor = ItemModuleInteractor(with: validator)
        presenter = MockPresenter()
        interactor?.presenter = presenter
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_createItem_should_return_nil_when_Label_not_valid(){
        //arrage
        validator.labelValidationReslt = false
        //acte
        let result = interactor?.createItem(label: "ABC", quantity: 100, price: 100)
        //assert
        XCTAssertNil(result)
        
    }
    
    func test_createItem_should_return_nil_when_quantity_not_valide(){
        //arrage
        validator.quantityValidationReslt = false
        //acte
        let result = interactor?.createItem(label: "ABC", quantity: 100, price: 100)
        //assert
        XCTAssertNil(result)
        
    }
    
    func test_createItem_should_return_nil_when_price_not_valide(){
        //arrage
        validator.priceValidationReslt = false
        //acte
        let result = interactor?.createItem(label: "ABC", quantity: 100, price: 100)
        //assert
        XCTAssertNil(result)
    }
    
    func test_createItem_should_return_Item_when_label_quantity_price_state_are_valide(){
        //arrage
        validator.quantityValidationReslt = true
        //acte
        let result = interactor?.createItem(label: "ABC", quantity: 100, price: 100)
        //assert
        XCTAssertNotNil(result)
    }
    
    func test_getQuantity_should_return_0_when_value_is_nil(){
        //arrage
        let expectedResult = 0
        let value:String? = nil
        //acte
        let result = interactor?.getQuantity(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getQuantity_should_return_0_when_value_is_not_number(){
        //arrage
        let expectedResult = 0
        let value = "ABC"
        //acte
        let result = interactor?.getQuantity(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getQuantity_should_return_2_when_value_is_2(){
        //arrage
        let expectedResult = 2
        let value:String? = "2"
        //acte
        let result = interactor?.getQuantity(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getPrice_should_return_0_when_value_is_nil(){
        //arrage
        let expectedResult = 0.0
        let value:String? = nil
        //acte
        let result = interactor?.getPrice(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getPrice_should_return_0_when_value_is_not_number(){
        //arrage
        let expectedResult = 0.0
        let value = "ABC"
        //acte
        let result = interactor?.getPrice(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getQuantity_should_return_15_3_when_value_is_15cama3(){
        //arrage
        let expectedResult = 15.3
        let value:String? = "15,3"
        //acte
        let result = interactor?.getPrice(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_getQuantity_should_return_15_3_when_value_is_15point3(){
        //arrage
        let expectedResult = 15.3
        let value:String? = "15.3"
        //acte
        let result = interactor?.getPrice(from: value)
        //assert
        XCTAssertEqual(result, expectedResult)
    }

    class MockPresenter: ItemModuleInteractorOutputProtocol {
    }
    
    class MockValidator: ItemValidatorProtocol {
        var labelValidationReslt = true
        var quantityValidationReslt = true
        var priceValidationReslt = true
        
        func validateLabel(_ label: String) -> Bool {
            return labelValidationReslt
        }
        
        func validateQuantity(_ quantity: Int) -> Bool {
            return quantityValidationReslt
        }
        
        func validatePrice(_ price: Double) -> Bool {
            return priceValidationReslt
        }
    }
}
