//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class PhraseTextField: UITextField {
    
    @IBInspectable var topPadding: CGFloat = 0
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var bottomPadding: CGFloat = 0
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return paddedRect(forBounds: bounds).offsetBy(dx: 0, dy: 0.5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return paddedRect(forBounds: bounds)
    }

    private func paddedRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        
        // Top Padding
        newBounds.origin.y += topPadding
        newBounds.size.height -= topPadding
        
        // Right Padding
        newBounds.size.width -= rightPadding
        
        // Bottom Padding
        newBounds.size.height -= bottomPadding
        
        // Left Padding
        newBounds.origin.x += leftPadding
        newBounds.size.width -= leftPadding

        return newBounds.integral
    }
    
}
