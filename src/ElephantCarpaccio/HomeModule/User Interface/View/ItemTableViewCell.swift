//
//  ItemTableViewCell.swift
//  ElephantCarpaccio
//
//  Created by Mahmoud BEN MESSAOUD on 18/03/2019.
//  Copyright © 2019 BENMESSAOUD. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with model: ItemViewModel) {
        nameLabel.text = model.name
        quantityLabel.text = model.quantity
        priceLabel.text = model.price
    }

}
