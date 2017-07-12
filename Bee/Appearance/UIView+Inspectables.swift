//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable public var backgroundColorName: String {
        
        get {
            return name(forColor: backgroundColor!)
        }
        
        set(colorName) {
            backgroundColor = color(withName: colorName)
        }
        
    }
    
    @IBInspectable public var borderColorName: String {
        
        get {
            return name(forColor: UIColor(cgColor: layer.borderColor!))
        }
        
        set(colorName) {
            layer.borderColor = color(withName: colorName).cgColor
        }
        
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        
        set(newWidth) {
            layer.borderWidth = newWidth
        }
        
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        
        get {
            return layer.cornerRadius
        }
        
        set(newRadius) {
            layer.cornerRadius = newRadius
            layer.masksToBounds = newRadius > 0
        }
        
    }
    
    private var colors: [String: UIColor] {
        return [
            "Primary": UIColor.primary,
            "Secondary": UIColor.secondary,
            "Tertiary": UIColor.tertiary,
            "Faded": UIColor.faded
        ]
    }
    
    // MARK: - Private helpers
    private func color(withName aName: String) -> UIColor {
        for (colorName, color) in colors {
            if aName.lowercased() == colorName.lowercased() {
                return color
            }
        }
        
        return UIColor.clear
    }
    
    private func name(forColor aColor: UIColor) -> String {
        for (colorName, color) in colors {
            if aColor == color {
                return colorName
            }
        }
        
        return "Unknown"
    }
}
