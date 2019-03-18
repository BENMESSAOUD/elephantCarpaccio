//
//  TicketModuleInteractor.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class TicketModuleInteractor: TicketModuleInteractorInputProtocol {
    weak var presenter: TicketModuleInteractorOutputProtocol?
    private var ticket: Ticket
    private var calculator: CalculatorProtocol
    init(items: [Item], state: State, calculator: CalculatorProtocol) {
        ticket = Ticket.init(items: items, state: state)
        self.calculator = calculator
    }
    
    func printTicket() {
        let totals  = getTicketTotals()
        let totalDiscount = calculator.calculateDiscount(total: totals.total)
        
        let list = totals.list
        let totalWithoutTax = "Total without taxes : \(totals.total)"
        let totalTax = "Tax \(ticket.state.tax()) % : +\(totals.totalTax)"
        let discountRow = "Discount \(calculator.getDiscountRate(totals.total))% : -\(totalDiscount)"
        let totalPrice = "Total price  : \(calculator.calculateFinalPrice(total: totals.total, totalTax: totals.totalTax, discount: totalDiscount))"
        let separator = "\n\n-------------------------------\n\n"
        
        let result = "\(list)\(separator)\(totalWithoutTax)\n\(discountRow)\n\(totalTax)\(separator)\(totalPrice)"
        presenter?.updateTicket(result)
    }
    
    
    private func getTicketTotals() -> (list: String, total:Double, totalTax:Double){
        let total = ticket.items.reduce(("", 0.0, 0.0)) {(result, item) -> (list: String, total:Double, totalTax:Double) in
            let totalItem = self.calculator.calculateTotal(quantity: item.quantity, price: item.price)
            let row = "> \(item.label)\t|\t\(item.quantity)\t|\t\(item.price)\t|\t\(totalItem)"
            let taxItem = self.calculator.claculateTax(total: totalItem, state: ticket.state)
            
            if result.0.isEmpty {
                return (row, totalItem, taxItem)
            }
            
            return (result.0.appending("\n\(row)"), result.1 + totalItem, result.2 + taxItem)
        }
        
        return total
    }
    
    
}
