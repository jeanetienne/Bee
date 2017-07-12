//
// Bee
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit
import CoreGraphics

class GradientView: UIView {

    @IBInspectable var reverse: Bool = false
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.primary.cgColor, UIColor.primary.withAlphaComponent(0).cgColor]
        gradientLayer.locations = [0.0, 0.5]
        
        if reverse {
            gradientLayer.colors?.reverse()
            gradientLayer.locations = [0.5, 1]
        }
        
        layer.addSublayer(gradientLayer)
        backgroundColor = UIColor.clear
    }
}
