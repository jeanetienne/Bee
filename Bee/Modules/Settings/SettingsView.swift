//
//  SettingsView.swift
//  Bee
//
//  Created by Jean-Étienne on 6/12/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {

    @IBOutlet weak var closeButton: UIButton!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var alphabetsTableView: UITableView!

    var interactor: SettingsInteractor!

    override func viewDidLoad() {
        super.viewDidLoad()

        closeButton.setTitle("Close", for: UIControlState.normal)
        titleLabel.text = "Settings"
    }

    @IBAction func closeButtonDidTouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        interactor.didSelectClose()
    }

}

extension SettingsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}

extension SettingsView: UITableViewDelegate {

}
