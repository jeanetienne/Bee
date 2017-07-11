//
//  SpellingViewController.swift
//  Bee
//
//  Created by Jean-Étienne on 6/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SpellingView: UIViewController {

    @IBOutlet weak var phraseTextField: UITextField!

    @IBOutlet weak var alphabetPicker: CollapsiblePicker!
    
    @IBOutlet weak var spellingTableView: UITableView!

    var controller: SpellingController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let cell = UINib(nibName: String(describing: SpelledCharacterTableViewCell.self), bundle: Bundle.main)
        spellingTableView.register(cell, forCellOfClass: SpelledCharacterTableViewCell.self)
        phraseTextField.delegate = self
        UIViewController.observeKeyboardWillShowNotification { notification in
            UIViewController.handleKeyboardWillShow(withNotification: notification,
                                                    onScrollView: self.spellingTableView)
        }
        UIViewController.observeKeyboardWillHideNotification { notification in
            UIViewController.handleKeyboardWillHide(withNotification: notification,
                                                    onScrollView: self.spellingTableView)
        }

        alphabetPicker.delegate = self
        controller.didLoadView()
    }

    // MARK: - Controller callbacks
    func setSpellingTableViewManager(manager: SpellingTableViewManager) {
        spellingTableView.dataSource = manager
        spellingTableView.delegate = manager
    }
    
    func updateAlphabets(_ updatedAlphabets: [String]) {
        alphabetPicker.items = updatedAlphabets
        alphabetPicker.selectItem(atIndex: 0)
    }

    func updateSpelling(withNumberOfCharacters numberOfCharacters: Int) {
        spellingTableView.reloadData()
        phraseTextField.resignFirstResponder()
    }

}

extension SpellingView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        controller.didSelectSpell(phrase: textField.text)
        return false
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        controller.didSelectClear()
        return true
    }
    
}

extension SpellingView: CollapsiblePickerDelegate {
    
    func pickerDidSelectItem(withName name: String) {
        controller.didSelectAlphabet(withName: name, phrase: phraseTextField.text)
    }
    
}
