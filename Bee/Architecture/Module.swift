//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

typealias ModuleCompletionHandler = (UIViewController) -> ()

extension UIViewController {

    static func loadFromStoryboard(withName storyboardName: String = "Main", identifier: String? = nil) -> UIViewController {
        let viewIdentifier = (identifier == nil) ? String(describing: self) : identifier!
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewIdentifier)
    }

}
