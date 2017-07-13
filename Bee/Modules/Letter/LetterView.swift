//  
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class LetterView: UIViewController {

    var controller: LetterController!

    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.didLoadView()
    }

    func updateLabels(letter: String, description: String?) {
        letterLabel.text = letter
        descriptionLabel.text = description
    }

    @IBAction func backButtonDidTouch(_ sender: Any) {
        controller.didSelectBack()
    }

}
