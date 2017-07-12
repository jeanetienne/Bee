//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation

import Speller

struct SpellingViewModel {

    private let spelledCharacters: [SpelledCharacter]

    var numberOfSpelledCharacters: Int {
        return spelledCharacters.count
    }

    init(withSpelling spelling: [SpelledCharacter]) {
        spelledCharacters = spelling
    }

    func spelledCharacterViewModel(at index: Int) -> SpelledCharacterViewModel {
        return SpelledCharacterViewModel(withSpelledCharacter: spelledCharacters[index])
    }
}
