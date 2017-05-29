//
//  DisclosureArrow.swift
//  Bee
//
//  Created by Jean-Étienne on 29/5/17.
//  Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

class DisclosureArrow: UIView {
 
    private var bezierLayer: CAShapeLayer

    required init?(coder aDecoder: NSCoder) {
        bezierLayer = CAShapeLayer()
        bezierLayer.zPosition = 1
        
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    override init(frame: CGRect) {
        bezierLayer = CAShapeLayer()
        bezierLayer.zPosition = 1
        
        super.init(frame: frame)
        
        customInit()
    }

    private func customInit() {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x:1, y:1))
        path.addLine(to: CGPoint(x:5, y:5))
        path.addLine(to: CGPoint(x:9, y:1))
        path.close()
        
        bezierLayer.path = path.cgPath
        bezierLayer.fillColor = UIColor.clear.cgColor
        bezierLayer.strokeColor = UIColor.faded.cgColor
        bezierLayer.lineCap = kCALineCapRound
        bezierLayer.lineJoin = kCALineJoinMiter
        bezierLayer.lineWidth = 2
        bezierLayer.strokeStart = 0.0
        bezierLayer.strokeEnd = 0.5857864376 //  2 / (2 + sqrt(2))
        
        layer.addSublayer(bezierLayer)
        backgroundColor = UIColor.clear
    }
    
}
