//
//  Rate.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-09-26.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//


import UIKit

class Rate: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFill: UIViewX!
    @IBOutlet weak var toggleMenuButton: UIButton!
    @IBOutlet weak var fbButton: UIButtonX!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    @IBOutlet weak var textToChange: UILabel!
    @IBOutlet weak var slider: UISlider!
    // New Stuff
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var cardView: UIViewX!
    
    @IBOutlet weak var rightCount: UILabel!
    @IBOutlet weak var leftCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButtons()
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeLeft)
        
    }
//    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer)
//    {
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer
//        {
//            switch swipeGesture.direction
//            {
//            case UISwipeGestureRecognizer.Direction.right:
//                //write your logic for right swipe
//                print("Swiped right")
//
//            case UISwipeGestureRecognizer.Direction.left:
//                //write your logic for left swipe
//                print("Swiped left")
//
//            default:
//                break
//            }
//        }
//    }
    
    @IBAction func toggleMenu(_ sender: UIButton) {
        toggleMenu()
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let xFromCenter = card.center.x - view.center.x
        
        /*
         Degrees   Radians
         15          .26
         25          .43
         35          .61
         */
        let rotationAngle = xFromCenter/view.frame.width * 0.61
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        
        // Maybe make this optional
        let scale = min(100/abs(xFromCenter) , 1)
        let stretchAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        card.transform = stretchAndRotation
        card.center = sender.location(in: view)
        
        // Set Thumb Image
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpUp")
            thumbImageView.tintColor = UIColor.green
            print("swipe right")
            let sum = ((rightCount.text! as NSString).floatValue) + 1
            //let finalSum = sum; +1
            rightCount.text = "\(sum)"
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpDown")
            thumbImageView.tintColor = UIColor.red
            print("swipe left")
            let sum = ((leftCount.text! as NSString).floatValue) + 1
            //let finalSum = sum; +1
            leftCount.text = "\(sum)"
        }
        
        // Show Thumb Image
        let alphaValue = abs(xFromCenter/view.center.x)
        thumbImageView.alpha = alphaValue
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 100 {
                // Thumbs Down
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                return
            } else if card.center.x > view.frame.width - 100 {
                // Thumbs Up
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                return
            }
            
            resetCard()
        }
    }
    
    @IBAction func sliderValue(_ sender: UISlider) {
        textToChange.font = textToChange.font.withSize(CGFloat(Int(sender.value)))
    }
    
    @IBAction func themeToggle(_ sender: UISwitch) {
        if (toggleSwitch.isOn)
        {
                cardView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        }
        else
        {
            cardView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        resetCard()
    }
    
    func resetCard() {
        UIView.animate(withDuration: 0.2, animations: {
            self.cardView.alpha = 1
            self.cardView.transform = .identity
            self.cardView.center = self.view.center
            self.thumbImageView.alpha = 0
        })
    }
}
