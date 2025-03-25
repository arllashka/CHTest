//
//  Untitled.swift
//  CHTest
//
//  Created by Arlan Kalin on 25.03.2025.
//

import UIKit

class CHLabel: CHView {
    
    var text: NSString? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var textColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var font: UIFont? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var attributes = [NSAttributedString.Key: Any]()
        attributes[NSAttributedString.Key.foregroundColor] = textColor
        attributes[NSAttributedString.Key.font] = font
    }
}
