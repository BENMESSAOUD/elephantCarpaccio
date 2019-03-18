//
//  HomeModuleWireFrame.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/18/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit
class HomeModuleWireFrame: HomeModuleWireFrameProtocol {
    private let homeControllerIdentifier = "HomeModuleViewController"
    private var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let itemWireframe = ItemModuleWireFrame()
    let ticketWireframe = TicketModuleWireFrame()
    
    func createModule() -> UIViewController? {
        // Generating module components
        let view = mainStoryboard.instantiateViewController(withIdentifier: homeControllerIdentifier) as?  HomeModuleViewProtocol & HomeModuleViewController
        let presenter: HomeModulePresenterProtocol & HomeModuleInteractorOutputProtocol = HomeModulePresenter()
        let interactor: HomeModuleInteractorInputProtocol = HomeModuleInteractor()
        let wireFrame: HomeModuleWireFrameProtocol = HomeModuleWireFrame()
        
        // Connecting
        view?.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentItemModule(from view:AnyObject?, validator:ItemValidatorProtocol, delegate: ItemModuleProtocol?) {
        itemWireframe.presentModule(from: view, validator: validator, with: delegate)
    }
    
    func presentTicketModule(from view:AnyObject?, items:[Item], state:State, calculator:CalculatorProtocol) {
        ticketWireframe.presentTicketModule(from: view, items: items, state: state, calculator: calculator)
    }
}
