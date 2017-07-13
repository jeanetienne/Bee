//  
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class LetterController {

    weak var view: LetterView!
    var router: LetterRouter
    var completionHandler: ModuleCompletionHandler?

    let letter: String
    let description: String?

    init(_ aLetter: String, _ aDescription: String?, _ aView: LetterView, _ aRouter: LetterRouter, _ aCompletionHandler: ModuleCompletionHandler? = nil) {
        view = aView
        router = aRouter
        completionHandler = aCompletionHandler

        letter = aLetter
        description = aDescription
    }

    // MARK: - User input
    func didLoadView() {
        view.updateLabels(letter: letter, description: description)
    }

    func didSelectBack() {
        dismissModule()
    }

    // MARK: - Private helpers
    private func dismissModule() {
        completionHandler?(view)
    }

}
