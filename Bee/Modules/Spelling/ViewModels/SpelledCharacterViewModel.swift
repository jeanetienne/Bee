//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation

import Speller

struct SpelledCharacterViewModel {

    let character: String

    let description: String

    init(withSpelledCharacter aSpelledCharacter: SpelledCharacter) {
        switch aSpelledCharacter {
        case .Match(let spelledCharacter, let codeWordCollection):
            character = spelledCharacter
            description = codeWordCollection.mainCodeWord
        case .Unknown(let spelledCharacter):
            character = spelledCharacter
            description = "Could not find a code word"
        case .Description(let spelledCharacter, let characterDescription):
            character = spelledCharacter
            description = characterDescription
        }
    }

}
