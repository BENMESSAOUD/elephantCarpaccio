//
//  TicketModuleProtocols.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

protocol TicketModuleViewProtocol: class {
    var presenter: TicketModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func bindData(with value:String?)
}

protocol TicketModuleWireFrameProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func presentTicketModule(from view:AnyObject?, items:[Item], state: State, calculator: CalculatorProtocol)
     func dismissModule(from view:AnyObject?)
}

protocol TicketModulePresenterProtocol: class {
    var view: TicketModuleViewProtocol? { get set }
    var interactor: TicketModuleInteractorInputProtocol? { get set }
    var wireFrame: TicketModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewDidLoad()
    func close()
}

protocol TicketModuleInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    
    func updateTicket(_ ticket:String)
}

protocol TicketModuleInteractorInputProtocol: class
{
    var presenter: TicketModuleInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
     func printTicket()
}
