//
//  ItemModulePresenter.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class ItemModulePresenter: ItemModulePresenterProtocol, ItemModuleInteractorOutputProtocol {
    weak var view: ItemModuleViewProtocol?
    var interactor: ItemModuleInteractorInputProtocol?
    var wireFrame: ItemModuleWireFrameProtocol?
    
    private weak var delegate: ItemModuleProtocol?
    private var label = ""
    private var quantity = 0
    private var price = 0.0
    init(delegate: ItemModuleProtocol?) {
        self.delegate = delegate
    }
    
    func cancel() {
        wireFrame?.dismissModule(from: view)
    }
    
    func addItem() {
        if let item = interactor?.createItem(label: label, quantity: quantity, price: price) {
            delegate?.addItem(item)
            wireFrame?.dismissModule(from: view)
        }
        else {
            view?.showAlert(title: "Error", message: "One or many field are invalid")
        }
    }
    
    func nameDidChanged(_ name: String?) {
        label = name ?? ""
    }
    
    func quantityDidChanged(_ quantity: String?) {
       self.quantity = interactor?.getQuantity(from: quantity) ?? 0
    }
    
    func priceDidChanged(_ price: String?) {
        self.price = interactor?.getPrice(from: price) ?? 0
    }
}
