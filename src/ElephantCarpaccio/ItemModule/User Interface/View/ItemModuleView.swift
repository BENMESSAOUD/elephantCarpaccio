//
//  ItemModuleView.swift
//  ElephantCarpaccio
//
//  Created by Mahmomud BEN MESSAOUD on 03/17/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

class ItemModuleViewController: UIViewController, ItemModuleViewProtocol {
    
    //MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var keyboardToolBar: UIToolbar!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        quantityTextField.inputAccessoryView = keyboardToolBar
        priceTextField.inputAccessoryView = keyboardToolBar
    }
    
    //MARK: IBAction
    @IBAction func addItem(_ sender: Any) {
        presenter?.addItem()
    }
    
    @IBAction func cancel(_ sender: Any) {
        presenter?.cancel()
    }
    @IBAction func dimissKeyboard(_ sender: Any) {
        quantityTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
    }
    
    //MARK: - ItemFactoryViewProtocol implementation
    var presenter: ItemModulePresenterProtocol?
    
    func showAlert(title:String, message:String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
}

extension ItemModuleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            presenter?.nameDidChanged(textField.text)
        }
        else if textField == quantityTextField {
            presenter?.quantityDidChanged(textField.text)
        }
        else if textField == priceTextField {
            presenter?.priceDidChanged(textField.text)
        }
    }
}

