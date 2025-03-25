//
//  CHView.swift
//  CHTest
//
//  Created by Arlan Kalin on 24.03.2025.
//

import UIKit

class CHView: UIResponder {
    var layer = CALayer()
    var subviews = [CHView]()
    
    weak var superview: CHView?
    
    override init() {
        super.init()
        layer.delegate = self
        setNeedsDisplay()
    }
    
    var frame: CGRect = .zero {
        didSet {
            layer.frame = frame
        }
    }
    
    var backgroundColor = UIColor.clear {
        didSet {
            layer.backgroundColor = backgroundColor.cgColor
        }
    }
    
    func draw(_ rect: CGRect) {
        
    }
    
    func addSubview(_ subview: CHView) {
        layer.addSublayer(subview.layer)
        subview.superview = self
        subviews.append(subview)
    }
    
    func setNeedsDisplay() {
        layer.setNeedsDisplay()
    }
    
    func hitTest(_ point: CGPoint, with event: UIEvent?) -> CHView {
        for subview in subviews {
            if subview.frame.contains(point) {
                let nextPoint = subview.layer.convert(point, from: layer)
                return subview.hitTest(nextPoint, with: event)
            }
        }
        return self
    }
    
    override var next: UIResponder? {
        return superview
    }
}

extension CHView: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        let bounds = ctx.boundingBoxOfClipPath
        UIGraphicsPushContext(ctx)
        draw(bounds)
        UIGraphicsPopContext()
    }
}
