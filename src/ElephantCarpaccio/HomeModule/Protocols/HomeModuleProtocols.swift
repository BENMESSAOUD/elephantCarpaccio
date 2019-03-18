//
//  HomeModuleProtocols.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/18/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

protocol HomeModuleViewProtocol: class {
    var presenter: HomeModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func bind(with model:HomeViewModel)
    func showPicker(with list:[String])
    func showAlert(title:String, message:String)
}

protocol HomeModuleWireFrameProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func createModule() -> UIViewController?
    func presentItemModule(from view:AnyObject?, validator:ItemValidatorProtocol, delegate: ItemModuleProtocol?)
    func presentTicketModule(from view:AnyObject?, items:[Item], state:State, calculator:CalculatorProtocol)
}

protocol HomeModulePresenterProtocol: class {
    var view: HomeModuleViewProtocol? { get set }
    var interactor: HomeModuleInteractorInputProtocol? { get set }
    var wireFrame: HomeModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func viewDidLoad()
    func showStateList()
    func updateState(_ value:String?)
    func addItem()
    func printTicket()
    func resetTicket()
}

protocol HomeModuleInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func viewModelDidChanged(_ viewModel: HomeViewModel)
}

protocol HomeModuleInteractorInputProtocol: class
{
    var presenter: HomeModuleInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getViewModel() -> HomeViewModel
    func updateState(_ value:String)
    func getStateList() -> [String]
    func getValidator() -> ItemValidatorProtocol
    func getCalculator() -> CalculatorProtocol
    func reset()
    func getState() -> State?
    func getItems() -> [Item]
}
