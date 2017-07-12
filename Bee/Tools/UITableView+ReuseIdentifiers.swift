//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

extension UITableView {

    func register(_ nib: UINib?, forCellOfClass cellClass: AnyClass) {
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }

    func dequeueReusableCell(withClass cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
    }

}
