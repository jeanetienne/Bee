//
//  SpellingViewController.swift
//  Bee
//
//  Created by Jean-Étienne on 6/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

import Speller

class SpellingViewController: UIViewController {

    @IBOutlet weak var phraseTextField: UITextField!

    @IBOutlet weak var spellButton: UIButton!

    @IBOutlet weak var spellingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func spellingButtonDidTouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        let speller = Speller()
        let spelling = speller.spell(phrase: "Bagpipe", withSpellingAlphabet: SpellingAlphabet.InternationalRadiotelephony)
        spellingLabel.text = spelling.debugDescription
    }
}

