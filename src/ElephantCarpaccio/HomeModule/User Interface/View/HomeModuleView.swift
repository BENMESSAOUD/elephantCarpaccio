//
//  HomeModuleView.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 03/18/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

class HomeModuleViewController: UIViewController, HomeModuleViewProtocol {
    //MARK: - properties
    private var items = [ItemViewModel]()
    private var states = [String]()
    private let cellIdentifier = "ItemCell"
    private var selectedState: String?
    
    //MARK: - IBOutlet
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var picketContainer: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        picketContainer.isHidden = true
        stateButton.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0, blue: 0.3490196078, alpha: 1).cgColor
        stateButton.layer.borderWidth = 1
        presenter?.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func updateState(_ sender: Any) {
        presenter?.showStateList()
    }
    
    @IBAction func addItem(_ sender: Any) {
        presenter?.addItem()
    }
    
    @IBAction func printTicket(_ sender: Any) {
        presenter?.printTicket()
    }
    
    @IBAction func reset(_ sender: Any) {
        presenter?.resetTicket()
    }
    
    @IBAction func donePicker(_ sender: Any) {
        presenter?.updateState(selectedState)
        picketContainer.isHidden = true
    }
    
    @IBAction func cancelPicker(_ sender: Any) {
        selectedState = nil
        picketContainer.isHidden = true
    }
    
    //MARK: - HomeModuleViewProtocol
    var presenter: HomeModulePresenterProtocol?
    func bind(with model:HomeViewModel) {
        stateButton.setTitle(model.state, for: .normal)
        items = model.items
        tableView.reloadData()
    }
    
    func showPicker(with list:[String]) {
        states = list
        pickerView.reloadAllComponents()
        picketContainer.isHidden = false
    }
    
    func showAlert(title:String, message:String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
}

extension HomeModuleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ItemTableViewCell
        cell?.bind(with: item)
        return cell ?? UITableViewCell()
    }
}

extension HomeModuleViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedState = states[row]
    }
}
