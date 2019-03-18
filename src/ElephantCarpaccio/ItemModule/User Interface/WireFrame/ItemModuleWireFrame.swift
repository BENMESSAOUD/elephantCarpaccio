//
//  ItemModuleWireFrame.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

class ItemModuleWireFrame: ItemModuleWireFrameProtocol {

    private let itemControllerIdentifier = "ItemModuleViewController"
    private var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func createModule(with delegate:ItemModuleProtocol?, validator: ItemValidatorProtocol) -> UIViewController? {
        // Generating module components
        let view = mainStoryboard.instantiateViewController(withIdentifier: itemControllerIdentifier) as?  ItemModuleViewController & ItemModuleViewProtocol
        let presenter: ItemModulePresenterProtocol & ItemModuleInteractorOutputProtocol = ItemModulePresenter(delegate: delegate)
        let interactor: ItemModuleInteractorInputProtocol = ItemModuleInteractor(with: validator)
        let wireFrame: ItemModuleWireFrameProtocol = self
        
        // Connecting
        view?.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func dismissModule(from view:AnyObject?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: nil)
        }
    }

    func presentModule(from view:AnyObject?,validator:ItemValidatorProtocol, with delegate:ItemModuleProtocol?) {
        guard let module = createModule(with: delegate, validator: validator) else {
            return
        }
        
        if let view = view as? UIViewController {
            view.present(module, animated: true, completion: nil)
        }
    }
}
