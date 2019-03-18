//
//  ItemValidator.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 17/03/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
protocol ItemValidatorProtocol {
    func validateLabel(_ label: String) -> Bool
    func validateQuantity(_ quantity: Int) -> Bool
    func validatePrice(_ price: Double) -> Bool
}

class ItemValidator: ItemValidatorProtocol {
    
    /// validation rules for label
    func validateLabel(_ label: String) -> Bool {
        return !label.isEmpty
    }
    
    /// validation rules for quantity
    func validateQuantity(_ quantity: Int) -> Bool {
        return quantity >= 0
    }
    
    /// validation rules for price
    func validatePrice(_ price: Double) -> Bool {
        return price >= 0
    }
}
