//
//  UserProfile.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-10-03.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

protocol UserProfileDelegate {
    func userProfile(vc: UserProfile, didEnterCode code: String)
}

class UserProfile: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: UserProfileDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self as? UITextFieldDelegate
    }

    func textFieldReturn(_ textField: UITextField) -> Bool
    {
        delegate?.userProfile(vc: self, didEnterCode: textField.text ?? "")
        textField.endEditing(true)
        return true
    }
}
