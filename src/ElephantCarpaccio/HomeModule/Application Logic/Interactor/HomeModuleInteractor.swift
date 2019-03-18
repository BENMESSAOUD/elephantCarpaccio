//
//  HomeModuleInteractor.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/18/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class HomeModuleInteractor: HomeModuleInteractorInputProtocol {

    weak var presenter: HomeModuleInteractorOutputProtocol?
    private var items = [Item]()
    private var state: State?
    private let validator = ItemValidator()
    private let calculator = Calculator()
    init() {}
    
    func getViewModel() -> HomeViewModel {
        let itemsViewModel = items.map { (item) -> ItemViewModel in
            return item.toItemViewModel()
        }
        return HomeViewModel.init(state: state?.rawValue, items: itemsViewModel)
    }
    
    func updateState(_ value:String) {
        state = State(rawValue: value)
        let viewModel = getViewModel()
        presenter?.viewModelDidChanged(viewModel)
    }
    
    func getStateList() -> [String] {
        return [State.ut.rawValue, State.nv.rawValue, State.tx.rawValue, State.al.rawValue, State.ca.rawValue]
    }
    
    func getValidator() -> ItemValidatorProtocol {
        return validator
    }
    
    func getCalculator() -> CalculatorProtocol {
        return calculator
    }
    
    func getItems() -> [Item] {
        return items
    }
    
    func getState() -> State? {
        return state
    }
    
    func reset() {
        items.removeAll()
        state = nil
        let viewModel = getViewModel()
        presenter?.viewModelDidChanged(viewModel)
    }

}

extension HomeModuleInteractor: ItemModuleProtocol {
    func addItem(_ item: Item) {
        items.append(item)
        let viewModel = getViewModel()
        presenter?.viewModelDidChanged(viewModel)
    }
}

extension Item {
    func toItemViewModel() -> ItemViewModel {
        return ItemViewModel.init(name: label, quantity: "\(quantity)", price: "\(price)")
    }
}
