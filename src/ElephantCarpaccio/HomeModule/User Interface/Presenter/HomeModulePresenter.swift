//
//  HomeModulePresenter.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/18/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class HomeModulePresenter: HomeModulePresenterProtocol, HomeModuleInteractorOutputProtocol {
    
    weak var view: HomeModuleViewProtocol?
    var interactor: HomeModuleInteractorInputProtocol?
    var wireFrame: HomeModuleWireFrameProtocol?

    init() {}
    
    func viewDidLoad() {
        if let viewModel = interactor?.getViewModel() {
            view?.bind(with: viewModel)
        }
    }
    
    func showStateList() {
        guard let list = interactor?.getStateList() else {
            return
        }
        view?.showPicker(with: list)
    }
    
    func updateState(_ value:String?) {
        guard let value = value else {
            return
        }
        interactor?.updateState(value)
    }
    
    func addItem() {
        guard let validator = interactor?.getValidator() else {
            return
        }
        wireFrame?.presentItemModule(from: view, validator: validator, delegate: interactor as? ItemModuleProtocol)
    }
    
    func printTicket() {
        guard let state = interactor?.getState() else {
            view?.showAlert(title: "Error", message: "Please select a state")
            return
        }
        guard let calculator = interactor?.getCalculator(), let items = interactor?.getItems() else {
            return
        }
        wireFrame?.presentTicketModule(from: view, items: items, state: state, calculator: calculator)
    }
    
    func resetTicket() {
        interactor?.reset()
    }
    
    //MARK: - HomeModuleInteractorOutputProtocol implementation
    func viewModelDidChanged(_ viewModel: HomeViewModel) {
        view?.bind(with: viewModel)
    }
    
}
