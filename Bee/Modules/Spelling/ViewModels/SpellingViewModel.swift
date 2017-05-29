//
//  SpellingViewModel.swift
//  Bee
//
//  Created by Jean-Étienne on 3/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
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
