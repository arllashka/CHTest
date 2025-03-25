//
//  CHButton.swift
//  CHTest
//
//  Created by Arlan Kalin on 25.03.2025.
//

import UIKit

class CHButton: CHControl {
    private var imageView = CHImageView()
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    override init() {
        super.init()
        addSubview(imageView)
    }
    
    override var frame: CGRect {
        didSet {
            imageView.frame = CGRect(origin: .zero, size: frame.size)
        }
    }
    
//    func addTarget(_ target: AnyObject, _ action: Selector) {
//        targets.append((target, action))
//    }
//    
//    private var targets = [(target: AnyObject, action: Selector)]()
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        targets.forEach {
//            UIApplication.shared.sendAction($0.action, to: $0.target, from: self, for: event)
//        }
//    }
}
