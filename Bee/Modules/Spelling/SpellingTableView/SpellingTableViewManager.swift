//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class SpellingTableViewManager: NSObject {
    
    var viewModel: SpellingViewModel?

    let controller: SpellingController

    init(controller aController: SpellingController) {
        controller = aController
    }
    
}

extension SpellingTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfSpelledCharacters ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SpelledCharacterTableViewCell.self,
                                                 for: indexPath) as! SpelledCharacterTableViewCell
        if let viewModel = viewModel {
            cell.configure(withViewModel: viewModel.spelledCharacterViewModel(at: indexPath.row))
        }
        
        return cell
    }
    
}

extension SpellingTableViewManager: UITableViewDelegate {
    
}
