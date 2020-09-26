//
//  StyleFields.swift
//  ClassTime
//
//  Created by Reiner Gonzalez on 9/26/20.
//

import Foundation
import UIKit

class StyleFields{
    
    
}

extension UIView {
    
    func errorShake() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 5.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 5.0, y: self.center.y)
        self.layer.add(animation, forKey: "position")
    }
}
