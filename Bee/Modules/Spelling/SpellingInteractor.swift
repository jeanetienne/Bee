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

    let alphabets = ["International Radiotelephony",
                     "US Financial", "LAPD", "French"]

    var selectedAlphabet = SpellingAlphabet.InternationalRadiotelephony

    init(view: SpellingView, router: SpellingRouter, completionHandler: @escaping ModuleCompletionHandler) {
        self.view = view
        self.router = router
        self.completionHandler = completionHandler
    }

    private func dismissModule() {
        self.completionHandler(self.view)
    }

    // MARK: - User input
    func didLoadView() {
        view.updateAlphabets(alphabets)
    }

    func didSelectSettings() {
        router.showSettings()
    }

    func didSelectAlphabet(alphabet: String, phrase: String?) {
        switch alphabet {
        case "International Radiotelephony":
            selectedAlphabet = SpellingAlphabet.InternationalRadiotelephony
        case "US Financial":
            selectedAlphabet = SpellingAlphabet.USFinancial
        case "LAPD":
            selectedAlphabet = SpellingAlphabet.LAPD
        case "French":
            selectedAlphabet = SpellingAlphabet.French
        default:
            selectedAlphabet = SpellingAlphabet.InternationalRadiotelephony
        }

        if let phrase = phrase {
            spell(phrase: phrase, withSpellingAlphabet: selectedAlphabet)
        }
    }

    func didSelectSpell(phrase: String?) {
        if let phrase = phrase {
            spell(phrase: phrase, withSpellingAlphabet: selectedAlphabet)
        }
    }

    func didSelectClear() {
        view.updateSpelling(SpellingViewModel(withSpelling: []))
    }

    // MARK: - Private helpers
    func spell(phrase: String, withSpellingAlphabet alphabet: SpellingAlphabet) {
        let spelling = Speller().spell(phrase: phrase, withSpellingAlphabet: alphabet)
        view.updateSpelling(SpellingViewModel(withSpelling: spelling))
    }

}
