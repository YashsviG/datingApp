//
//  nameController.swift
//  datingAppYashi
//
//  Created by Yashsvi Girdhar on 2020-10-03.
//  Copyright © 2020 Yashsvi Girdhar. All rights reserved.
//

import UIKit

class nameController: UIViewController
{
    @IBOutlet weak var username: UILabel!

    func showEditName(_ coder: NSCoder) -> UserProfile?
    {
        let viewController = UserProfile(coder: coder)
        viewController?.delegate = self as? UserProfileDelegate
        return viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = "Yashi"
    }
}
