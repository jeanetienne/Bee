//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

extension UIView {

    func toggleAlpha(withDuration duration: TimeInterval, condition: () -> Bool) {
        if condition() {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0
            })
        }
    }

}
