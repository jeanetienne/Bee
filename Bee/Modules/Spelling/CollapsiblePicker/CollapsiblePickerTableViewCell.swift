//
//  CollapsiblePickerTableViewCell.swift
//  Bee
//
//  Created by Jean-Étienne on 26/5/17.
//  Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class CollapsiblePickerTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    
    func configure(withItemName name: String) {
        itemName.text = name
        itemName.textColor = UIColor.faded
    }
    
}
