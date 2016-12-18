//
//  SettingsRouter.swift
//  Bee
//
//  Created by Jean-Étienne on 6/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SettingsRouter {

    var view: SettingsView

    init(view: SettingsView) {
        self.view = view
    }

    static func createModule(completionHandler: @escaping ModuleCompletionHandler) -> UIViewController {
        let view = SettingsView.loadViewController() as! SettingsView
        let router = SettingsRouter(view: view)
        let interactor = SettingsInteractor(view: view, router: router, completionHandler: completionHandler)
        view.interactor = interactor

        return view
    }

}
