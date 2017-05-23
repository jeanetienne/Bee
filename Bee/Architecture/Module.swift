//
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

typealias ModuleCompletionHandler = (UIViewController) -> ()

extension UIViewController {

    static func loadViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }

}
