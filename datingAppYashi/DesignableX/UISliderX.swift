//
//  UISliderX.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-09-26.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

@IBDesignable
class UISliderX: UISlider {
    
    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
}

