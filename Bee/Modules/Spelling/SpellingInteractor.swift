//
//  SpellingInteractor.swift
//  Bee
//
//  Created by Jean-Étienne on 27/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

import Speller

class SpellingInteractor {

    var view: SpellingView

    var router: SpellingRouter

    var completionHandler: ModuleCompletionHandler

    init(view: SpellingView, router: SpellingRouter, completionHandler: @escaping ModuleCompletionHandler) {
        self.view = view
        self.router = router
        self.completionHandler = completionHandler
    }

    private func dismissModule() {
        self.completionHandler(self.view)
    }

    // MARK: - User input
    func didSelectSettings() {
        router.showSettings()
    }

    func didSelectSpell(phrase: String?) {
        if let phrase = phrase {
            let spelling = Speller().spell(phrase: phrase, withSpellingAlphabet: SpellingAlphabet.InternationalRadiotelephony)
            view.updateSpelling(SpellingViewModel(withSpelling: spelling))
        }
    }

    func didSelectClear() {
        view.updateSpelling(SpellingViewModel(withSpelling: []))
    }

}
