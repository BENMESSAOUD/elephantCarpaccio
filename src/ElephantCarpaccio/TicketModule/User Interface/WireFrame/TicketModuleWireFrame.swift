//
//  TicketModuleWireFrame.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

class TicketModuleWireFrame: TicketModuleWireFrameProtocol {

    private let ticketControllerIdentifier = "TicketModuleViewController"
    private var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func createModule(items:[Item], state: State, calculator: CalculatorProtocol) -> UIViewController? {
        let view = mainStoryboard.instantiateViewController(withIdentifier: ticketControllerIdentifier) as?  TicketModuleViewProtocol & TicketModuleViewController
        let presenter: TicketModulePresenterProtocol & TicketModuleInteractorOutputProtocol = TicketModulePresenter()
        let interactor: TicketModuleInteractorInputProtocol = TicketModuleInteractor(items: items, state: state, calculator: calculator)
        let wireFrame: TicketModuleWireFrameProtocol = self
        
        // Connecting
        view?.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentTicketModule(from view:AnyObject?, items:[Item], state: State, calculator: CalculatorProtocol) {
        guard let module = createModule(items: items, state: state, calculator: calculator) else {
            return
        }
        
        if let view = view as? UIViewController {
            view.present(module, animated: true, completion: nil)
        }
    }
    
    func dismissModule(from view:AnyObject?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
