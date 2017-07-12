//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var primary: UIColor {
        return UIColor.pastelYellow
    }
    
    static var secondary: UIColor {
        return UIColor.pastelRed
    }
    
    static var tertiary: UIColor {
        return UIColor.almostWhite
    }
    
    static var faded: UIColor {
        return UIColor.fadedDarkYellow
    }
    
}


extension UIColor {
    
    static var pastelYellow: UIColor {
        return UIColor(red: 255/255, green: 220/255, blue: 115/255, alpha: 1)
    }
    
    static var pastelRed: UIColor {
        return UIColor(red: 255/255, green: 143/255, blue: 115/255, alpha: 1)
    }
    
    static var almostWhite: UIColor {
        return UIColor(red: 255/255, green: 254/255, blue: 252/255, alpha: 1)
    }
    
    static var fadedDarkYellow: UIColor {
        return UIColor(red: 85/255, green: 82/255, blue: 72/255, alpha: 1)
    }
    
}
