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

    var completionHandler: ModuleCompletionHandler

    init(view: SpellingView, completionHandler: @escaping ModuleCompletionHandler) {
        self.view = view
        self.completionHandler = completionHandler
    }

    func dismissModule() {
        self.completionHandler(self.view)
    }

    // MARK: - User input
    func didSelectSpell(phrase: String?) {
        if let phrase = phrase {
            let speller = Speller()
            let spelling = speller.spell(phrase: phrase, withSpellingAlphabet: SpellingAlphabet.InternationalRadiotelephony)
            view.updateSpelling(SpellingViewModel(withSpelling: spelling))
        }
    }

    func didSelectClear() {
        view.updateSpelling(SpellingViewModel(withSpelling: []))
    }

    // MARK: - View update
    
}
