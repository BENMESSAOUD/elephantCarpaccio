//
//  Calculator.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 17/03/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

protocol CalculatorProtocol {
    func calculateTotal(quantity: Int, price: Double) -> Double
    func claculateTax(total: Double, state:State) -> Double
    func calculateDiscount(total: Double) -> Double
    func calculateFinalPrice(total: Double, totalTax:Double, discount: Double) -> Double
    func getDiscountRate(_ total: Double) -> Double
}

enum State: String {
    case ut = "UT"
    case nv = "NV"
    case tx = "TX"
    case al = "AL"
    case ca = "CA"
    
    func tax() -> Double {
        switch self {
        case .ut:
            return 6.85
        case .nv:
            return 8.0
        case .tx:
            return 6.25
        case .al:
            return 4.0
        case .ca:
            return 8.25
        }
    }
}


/// Calculator
///
/// This class contain calculation logic
class Calculator: CalculatorProtocol {
    
    /// Calculate total price of an item.
    ///
    /// - Parameter quantity: item quantity.
    /// - Parameter price: item price.
    func calculateTotal(quantity: Int, price: Double) -> Double {
        return Double(quantity)*price
    }
    
    /// Calculate tax.
    ///
    /// - Parameter total: total without tax.
    /// - Parameter state: state tax rate.
    func claculateTax(total: Double, state:State) -> Double {
        return total*state.tax()/100.0
    }
    
    /// Calculate discount.
    ///
    /// - Parameter total: total without tax.
    func calculateDiscount(total: Double) -> Double {
        let rate = getDiscountRate(total)
        return total*rate/100.0
    }
    
    /// Get discount rate.
    ///
    /// - Parameter total: total without tax.
    func getDiscountRate(_ total: Double) -> Double {
        if total > 50000 {
            return 15
        }
        if total > 10000 {
            return 10
        }
        if total > 7000 {
            return 7
        }
        if total > 5000 {
            return 5
        }
        if total > 1000 {
            return 3
        }
        
        return 0.0
    }
    
    /// Get fianl price.
    ///
    /// - Parameter total: total without tax.
    /// - Parameter totalTax: total tax.
    /// - Parameter discount: total discount.
    func calculateFinalPrice(total: Double, totalTax:Double, discount: Double) -> Double {
        return total - discount + totalTax
    }
}
