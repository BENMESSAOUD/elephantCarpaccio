//
//  ItemModulePresenterTests.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import XCTest
@testable import ElephantCarpaccio
class ItemPresenterTest: XCTestCase {
    var delegate: MockDelegate?
    var presenter: ItemModulePresenter?
    var interactor: MockInteractor?
    var view: MockViewController?
    override func setUp() {
        super.setUp()
        delegate = MockDelegate()
        presenter = ItemModulePresenter(delegate: delegate)
        interactor = MockInteractor()
        view = MockViewController()
        presenter?.view = view
        presenter?.interactor = interactor
    }

    override func tearDown() {
        delegate = nil
        presenter = nil
        interactor = nil
        view = nil
        super.tearDown()
    }
    
    func test_addItem_should_invokeAddItem_when_item_not_nil(){
        //arrage
        let mockItem = Item.init(label: "", quantity: 0, price: 0.0)
        interactor?.mockItem = mockItem
        //acte
        presenter?.addItem()
        let result = delegate?.addItemInvoked ?? false
        //assert
        XCTAssertTrue(result)
    }
    
    func test_addItem_should_showAlert_when_item_nil(){
        //arrage
        let mockItem: Item? = nil
        interactor?.mockItem = mockItem
        //acte
        presenter?.addItem()
        let result = view?.showAlertInvoked ?? false
        //assert
        XCTAssertTrue(result)
    }
    
    class MockDelegate: ItemModuleProtocol {
        var addItemInvoked = false
        func addItem(_ item: Item) {
            addItemInvoked = true
        }
    }

    class MockInteractor: ItemModuleInteractorInputProtocol {
        
        var createItemInvoked = false
        var mockItem: Item?
        var mockQuantity = 0
        var mockPrice = 0.0
        func createItem(label: String, quantity: Int, price: Double) -> Item? {
            createItemInvoked = true
            return mockItem
        }
        
        func getQuantity(from value: String?) -> Int {
            return mockQuantity
        }
        
        func getPrice(from value: String?) -> Double {
            return mockPrice
        }
        
        var presenter: ItemModuleInteractorOutputProtocol?

    }

    class MockViewController: ItemModuleViewProtocol {
        var showAlertInvoked = false
        func showAlert(title: String, message: String) {
            showAlertInvoked = true
        }
        
        var presenter: ItemModulePresenterProtocol?
        

        func setupInitialState() {

        }
    }
}
