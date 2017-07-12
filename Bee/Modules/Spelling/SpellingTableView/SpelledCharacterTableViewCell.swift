//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class SpelledCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(withViewModel viewModel: SpelledCharacterViewModel) {
        characterLabel.text = viewModel.character
        descriptionLabel.text = viewModel.description
    }

}
