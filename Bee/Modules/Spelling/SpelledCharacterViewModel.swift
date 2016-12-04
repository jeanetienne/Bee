//
//  SpelledCharacterViewModel.swift
//  Bee
//
//  Created by Jean-Étienne on 3/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import Foundation

import Speller

struct SpelledCharacterViewModel {

    let character: String

    let codeWord: String

    init(withSpelledCharacter aSpelledCharacter: SpelledCharacter) {
        switch aSpelledCharacter {
        case .Match(let spelledCharacter, let codeWordCollection):
            character = String(spelledCharacter)
            codeWord = codeWordCollection.mainCodeWord
        case .Unknown(let spelledCharacter):
            character = String(spelledCharacter)
            codeWord = "Could not find a code word"
        }
    }

}
