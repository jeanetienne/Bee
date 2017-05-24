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

    @IBOutlet weak var spellingTableView: UITableView!

    var interactor: SpellingInteractor!

    var spellingViewModel: SpellingViewModel!

    var alphabets: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.spellingTableView.alpha = 0

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

        interactor.didLoadView()
    }

    // MARK: - Interactor callbacks
    func updateAlphabets(_ alphabets: [String]) {
        self.alphabets = alphabets
    }

    func updateSpelling(_ spellingViewModel: SpellingViewModel) {
        self.spellingViewModel = spellingViewModel
        spellingTableView.toggleAlpha(withDuration: 0.1) {
            spellingViewModel.numberOfSpelledCharacters > 0
        }
        spellingTableView.reloadData()
        phraseTextField.resignFirstResponder()
    }
}

extension SpellingView: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alphabets.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let alphabetName = alphabets[row]
        interactor.didSelectAlphabet(alphabet: alphabetName, phrase: phraseTextField.text)
    }

}

extension SpellingView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alphabets[row]
    }

}

extension SpellingView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SpelledCharacterTableViewCell.self,
                                                 for: indexPath) as! SpelledCharacterTableViewCell
        cell.configure(withViewModel: spellingViewModel.spelledCharacterViewModel(at: indexPath.row))

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = spellingViewModel {
            return viewModel.numberOfSpelledCharacters
        } else {
            return 0
        }
    }

}

extension SpellingView: UITableViewDelegate {

}

extension SpellingView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        interactor.didSelectSpell(phrase: textField.text)
        return false
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        interactor.didSelectClear()
        return true
    }
    
}
