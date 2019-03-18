//
//  ItemModuleInteractor.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class ItemModuleInteractor: ItemModuleInteractorInputProtocol {

    weak var presenter: ItemModuleInteractorOutputProtocol?
    private var validator: ItemValidatorProtocol
    init(with validator: ItemValidatorProtocol) {
        self.validator = validator
    }
    
    func createItem(label:String, quantity: Int, price: Double) -> Item? {
        let labelIsValid = validator.validateLabel(label)
        let quantityIsValid = validator.validateQuantity(quantity)
        let priceIsValid = validator.validatePrice(price)
        
        guard labelIsValid && quantityIsValid && priceIsValid else { return nil }
        
        return Item.init(label: label, quantity: quantity, price: price)
    }
    
    func getQuantity(from value: String?) -> Int {
        guard let quantity = value else {
            return 0
        }
        return Int(quantity) ?? 0
    }
    
    func getPrice(from value: String?) -> Double {
        guard let price = value?.replacingOccurrences(of: ",", with: ".") else {
            return 0.0
        }
        return Double(price) ?? 0.0
    }
}
