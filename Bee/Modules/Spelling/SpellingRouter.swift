//
//  SpellingRouter.swift
//  Bee
//
//  Created by Jean-Étienne on 27/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SpellingRouter {

    weak var view: SpellingView!

    init(view: SpellingView) {
        self.view = view
    }

    static func createModule(completionHandler: ModuleCompletionHandler? = nil) -> UIViewController {
        let view = SpellingView.loadViewController() as! SpellingView
        let router = SpellingRouter(view: view)
        let interactor = SpellingInteractor(view: view, router: router, completionHandler: completionHandler)
        view.interactor = interactor

        return view
    }

}
