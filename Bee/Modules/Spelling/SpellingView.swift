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

    @IBOutlet weak var spellButton: UIButton!

    @IBOutlet weak var spellingTableView: UITableView!

    var interactor: SpellingInteractor!

    var spellingViewModel: SpellingViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        spellButton.setTitle("Spell", for: UIControlState.normal)
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
    }

    @IBAction func spellingButtonDidTouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        interactor.didSelectSpell(phrase: phraseTextField.text)
    }

    // MARK: - Interactor callbacks
    func updateSpelling(_ spellingViewModel: SpellingViewModel) {
        self.spellingViewModel = spellingViewModel
        spellingTableView.toggleAlpha(withDuration: 0.1) {
            spellingViewModel.numberOfSpelledCharacters > 0
        }
        spellingTableView.reloadData()
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
        textField.resignFirstResponder()
        return false
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        interactor.didSelectClear()
        return true
    }
    
}
