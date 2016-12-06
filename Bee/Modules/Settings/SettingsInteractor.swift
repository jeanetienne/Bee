//
//  SettingsInteractor.swift
//  Bee
//
//  Created by Jean-Étienne on 6/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SettingsInteractor {

    var view: SettingsView

    var router: SettingsRouter

    var completionHandler: ModuleCompletionHandler

    init(view: SettingsView, router: SettingsRouter, completionHandler: @escaping ModuleCompletionHandler) {
        self.view = view
        self.router = router
        self.completionHandler = completionHandler
    }

    func dismissModule() {
        self.completionHandler(self.view)
    }

}
