//
//  CHControl.swift
//  CHTest
//
//  Created by Arlan Kalin on 25.03.2025.
//

import UIKit

enum ControlEvent {
    case touchUpInside
    case touchUpOutside
    case touchDown
}

class CHControl: CHView {
    private var targets = [(target: AnyObject, action: Selector, controlEvent: ControlEvent)]()
    func addTarget(target: AnyObject, action: Selector, for controlEvent: ControlEvent) {
        targets.append ((target, action, controlEvent))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        targets.forEach {
            if $0.controlEvent == .touchDown {
                UIApplication.shared.sendAction($0.action, to: $0.target, from: self, for: event)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        targets.forEach {
            guard let touch = touches.first else { return }
            let window = UIApplication.shared.windows.first!
            let location = layer.superlayer!.convert(touch.location(in: window), from: window.layer)
            if $0.controlEvent == .touchUpInside && frame.contains(location) {
                UIApplication.shared.sendAction($0.action, to: $0.target, from: self, for: event)
                if $0.controlEvent == .touchUpOutside && !frame.contains(location) {
                    UIApplication.shared.sendAction ($0.action, to: $0.target, from: self, for: event)
                }
            }
        }
    }
}
