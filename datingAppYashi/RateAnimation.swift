//
//  RateAnimation.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-09-26.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

extension Rate {
    
    func hideButtons() {
        fbButton.alpha = 0
        toggleSwitch.alpha = 0
        slider.alpha = 0
    }
    
    func toggleMenu() {
        if darkFill.transform == .identity {
            UIView.animate(withDuration: 1, animations: {
                self.darkFill.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -67)
                self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: self.radians(180))
            }) { (true) in
                self.toggleShareButtons()
            }
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.darkFill.transform = .identity
                self.menuView.transform = .identity
                self.toggleMenuButton.transform = .identity
                self.toggleShareButtons()
            })
        }
    }
    
    func toggleShareButtons() {
        let alpha = CGFloat(fbButton.alpha == 1 ? 0 : 1)
        self.fbButton.alpha = alpha
        self.toggleSwitch.alpha = alpha
        self.slider.alpha = alpha
    }
    
    func radians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * .pi / degrees)
    }
}
