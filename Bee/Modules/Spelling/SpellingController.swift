//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

import Speller

class SpellingController {

    struct SpellingAlphabetDescription {
        var name: String
        var alphabet: SpellingAlphabet
    }
    
    weak var view: SpellingView!

    var router: SpellingRouter

    var completionHandler: ModuleCompletionHandler?

    lazy var spellingTableViewManager: SpellingTableViewManager = {
        return SpellingTableViewManager(controller: self)
    }()
    
    let alphabets: [SpellingAlphabetDescription] = [
        SpellingAlphabetDescription(name: "International Radiotelephony", alphabet: .InternationalRadiotelephony),
        SpellingAlphabetDescription(name: "US Financial", alphabet: .USFinancial),
        SpellingAlphabetDescription(name: "LAPD", alphabet: .LAPD),
        SpellingAlphabetDescription(name: "Czech", alphabet: .Czech),
        SpellingAlphabetDescription(name: "Danish", alphabet: .Danish),
        SpellingAlphabetDescription(name: "Dutch", alphabet: .Dutch),
        SpellingAlphabetDescription(name: "Finnish", alphabet: .Finnish),
        SpellingAlphabetDescription(name: "French", alphabet: .French),
        SpellingAlphabetDescription(name: "German", alphabet: .German),
        SpellingAlphabetDescription(name: "Italian", alphabet: .Italian),
        SpellingAlphabetDescription(name: "Norwegian", alphabet: .Norwegian),
        SpellingAlphabetDescription(name: "Portuguese", alphabet: .Portuguese),
        SpellingAlphabetDescription(name: "Brazilian Portuguese", alphabet: .PortugueseBrazilian),
        SpellingAlphabetDescription(name: "Slovene", alphabet: .Slovene),
        SpellingAlphabetDescription(name: "Spanish", alphabet: .Spanish),
        SpellingAlphabetDescription(name: "Swedish", alphabet: .Swedish),
        SpellingAlphabetDescription(name: "Turkish", alphabet: .Turkish),
        SpellingAlphabetDescription(name: "PGP Word List", alphabet: .PGPWordList)
    ]

    var selectedAlphabet = SpellingAlphabet.InternationalRadiotelephony

    var currentSpelling: [SpelledCharacter] = []

    init(view aView: SpellingView, router aRouter: SpellingRouter, completionHandler aCompletionHandler: ModuleCompletionHandler? = nil) {
        view = aView
        router = aRouter
        completionHandler = aCompletionHandler
    }

    private func dismissModule() {
        completionHandler?(view)
    }

    // MARK: - User input
    func didLoadView() {
        view.setSpellingTableViewManager(manager: spellingTableViewManager)
        view.updateAlphabets(alphabets.map { spellingAlphabetDescription -> String in
            return spellingAlphabetDescription.name
        })
    }

    func didPresentView() {
        view.deselectSpellingTableView()
    }

    func didSelectAlphabet(withName name: String, phrase: String?) {
        selectedAlphabet = alphabets.first(where: { spellingAlphabetDescription -> Bool in
            spellingAlphabetDescription.name == name
        })?.alphabet ?? .InternationalRadiotelephony
        
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
        spellingTableViewManager.viewModel = SpellingViewModel(withSpelling: [])
        view.updateSpelling(withNumberOfCharacters: 0)
    }

    // MARK: - Private helpers
    func spell(phrase: String, withSpellingAlphabet alphabet: SpellingAlphabet) {
        currentSpelling = Speller.spell(phrase: phrase, withSpellingAlphabet: alphabet)
        let spellingViewModel = SpellingViewModel(withSpelling: currentSpelling)

        spellingTableViewManager.viewModel = spellingViewModel
        view.updateSpelling(withNumberOfCharacters: spellingViewModel.numberOfSpelledCharacters)
    }

}

extension SpelledCharacter {

    var letter: String {
        switch self {
        case .Match(let character, _):
            return character
        case .Description(let character, _):
            return character
        case .Unknown(let character):
            return character
        }
    }

    var description: String? {
        switch self {
        case .Match(_, let codeWordCollection):
            return codeWordCollection.mainCodeWord
        case .Description(_, let description):
            return description
        case .Unknown(_):
            return nil
        }
    }

}
