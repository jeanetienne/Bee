//  
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class LetterRouter {

    weak var view: LetterView!

    init(_ aView: LetterView) {
        view = aView
    }

    static func entryPoint(letter: String, description: String?, completionHandler: ModuleCompletionHandler? = nil) -> UIViewController {
        let view = LetterView(nibName: nil, bundle: nil)
        let router = LetterRouter(view)
        let controller = LetterController(letter, description, view, router, completionHandler)
        view.controller = controller

        return view
    }

}
