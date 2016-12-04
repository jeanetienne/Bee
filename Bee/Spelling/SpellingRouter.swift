//
//  SpellingRouter.swift
//  Bee
//
//  Created by Jean-Étienne on 27/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SpellingRouter {

    static func createModule(completionHandler: @escaping ModuleCompletionHandler) -> UIViewController {
        let view = SpellingView.loadViewController() as! SpellingView
        let interactor = SpellingInteractor(view: view, completionHandler: completionHandler)
        view.interactor = interactor

        return view
    }

}
