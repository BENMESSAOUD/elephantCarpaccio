//
//  TicketModuleInteractorTests.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import XCTest
@testable import ElephantCarpaccio
class TicketInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockPresenter: TicketModuleInteractorInputProtocol {
        func printTicket() {
            
        }
        
        var presenter: TicketModuleInteractorOutputProtocol?
    }
}
