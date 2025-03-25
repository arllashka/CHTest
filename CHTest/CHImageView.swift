//
//  CHImageView.swift
//  CHTest
//
//  Created by Arlan Kalin on 25.03.2025.
//

import UIKit

class CHImageView: CHView {
    override init() {
        super.init()
        layer.delegate = self
    }
    
    var image: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
}

extension CHImageView {
    func display(_ layer: CALayer) {
        layer.contents = image?.cgImage
    }
}
