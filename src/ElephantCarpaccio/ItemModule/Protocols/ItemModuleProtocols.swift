//
//  ItemModuleProtocols.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

protocol ItemModuleProtocol: class{
    func addItem(_ item: Item)
}

protocol ItemModuleViewProtocol: class {
    var presenter: ItemModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showAlert(title:String, message:String)
}

protocol ItemModuleWireFrameProtocol: class {
    func dismissModule(from view:AnyObject?)
    func presentModule(from view:AnyObject?,validator:ItemValidatorProtocol, with delegate:ItemModuleProtocol?)
}

protocol ItemModulePresenterProtocol: class {
    var view: ItemModuleViewProtocol? { get set }
    var interactor: ItemModuleInteractorInputProtocol? { get set }
    var wireFrame: ItemModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func cancel()
    func addItem()
    func nameDidChanged(_ name: String?)
    func quantityDidChanged(_ quantity: String?)
    func priceDidChanged(_ price: String?)
}

protocol ItemModuleInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol ItemModuleInteractorInputProtocol: class
{
    var presenter: ItemModuleInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
    func createItem(label:String, quantity: Int, price: Double) -> Item?
    func getQuantity(from value: String?) -> Int
    func getPrice(from value: String?) -> Double
}
