//
//  ViewController.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-09-26.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var goButton: UIButtonX!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.alpha = 0
        titleLabel.alpha = 0
        descLabel.alpha = 0
        goButton.alpha = 0
        findLabel.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.bgImage.alpha = 0.6
        }) { (true) in
            self.showTitle()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func showTitle() {
        UIView.animate(withDuration: 0.1, animations: {
            self.titleLabel.alpha = 1
        }) {(true) in
            self.showDesc()
        }
    }
    
    func showDesc() {
        UIView.animate(withDuration: 0.1, animations: {
            self.descLabel.alpha = 1
        }) {(true) in
            self.showButtonAndFind()
        }
    }
    
    func showButtonAndFind() {
        UIView.animate(withDuration: 0.1, animations: {
            self.goButton.alpha = 1
            self.findLabel.alpha = 1
        }) {(true) in
            
            UIView.animate(withDuration: 0.5, delay: 8, options: .allowUserInteraction, animations: {
                self.goButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }) {(true) in
                self.goButton.transform = CGAffineTransform.identity
            }
        }
    }
}

