//
//  TicketModulePresenter.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation

class TicketModulePresenter: TicketModulePresenterProtocol, TicketModuleInteractorOutputProtocol {
    weak var view: TicketModuleViewProtocol?
    var interactor: TicketModuleInteractorInputProtocol?
    var wireFrame: TicketModuleWireFrameProtocol?

    init() {}
    func viewDidLoad() {
        interactor?.printTicket()
    }
    
    func close() {
        wireFrame?.dismissModule(from: view)
    }
    
    func updateTicket(_ ticket: String) {
        view?.bindData(with: ticket)
    }
}
