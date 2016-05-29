//
//  HomeViewController.swift
//  ContactsList
//
//  Created by Abdelrahman Mohamed on 5/29/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        greetingsLabel.text = "Welcome! \(username!)"
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "username")
        
        let loginViewController = self.storyboard?.instantiateInitialViewController()
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }
}
