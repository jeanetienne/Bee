//
//  SpelledCharacterTableViewCell.swift
//  Bee
//
//  Created by Jean-Étienne on 3/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SpelledCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withViewModel viewModel: SpelledCharacterViewModel) {
        characterLabel.text = viewModel.character
        descriptionLabel.text = viewModel.description
    }

}
