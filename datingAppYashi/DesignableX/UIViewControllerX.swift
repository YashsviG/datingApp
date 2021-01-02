//
//  UIViewControllerX.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-09-26.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewControllerX: UIViewController {
    
    @IBInspectable var lightStatusBar: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if lightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}

