//
//  TicketModuleView.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

class TicketModuleViewController: UIViewController, TicketModuleViewProtocol {
    
    //MARK: - IBOutlet
    @IBOutlet weak var textView: UITextView!
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func close(_ sender: Any) {
        presenter?.close()
    }
    
    //MARK: - TicketModuleViewProtocol implmentation
    var presenter: TicketModulePresenterProtocol?
    func bindData(with value:String?) {
        textView.text = value
    }
}
