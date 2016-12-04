//
//  UITableView+ReuseIdentifiers.swift
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

extension UITableView {

    func register(_ nib: UINib?, forCellOfClass cellClass: AnyClass) {
        self.register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }

    func dequeueReusableCell(withClass cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
    }

}
