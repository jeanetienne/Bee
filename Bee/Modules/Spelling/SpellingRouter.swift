//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class SpellingRouter {

    weak var view: SpellingView!

    init(view aView: SpellingView) {
        view = aView
    }

    static func entryPoint(completionHandler: ModuleCompletionHandler? = nil) -> UIViewController {
        let view = SpellingView.loadFromStoryboard() as! SpellingView
        let router = SpellingRouter(view: view)
        let controller = SpellingController(view: view, router: router, completionHandler: completionHandler)
        view.controller = controller

        return view
    }

}
