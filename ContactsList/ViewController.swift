//
//  ViewController.swift
//  ContactsList
//
//  Created by Abdelrahman Mohamed on 5/29/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = CoreDataStackManager.sharedInstacne().managedObjectContext
    }

    @IBAction func loginAction(sender: AnyObject) {
        
    }
    
    @IBAction func createAccountAction(sender: AnyObject) {
        
        alertDialog()
    }
    
    func alertDialog() {
        
        let alert = UIAlertController(title: "Create New Account", message: "Enter Username and Password", preferredStyle: .Alert)
        
        // create btn
        let create = UIAlertAction(title: "Save", style: .Default, handler: { (UIAlertAction) in
            
            let usernameField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            if (usernameField.text != "" && passwordField.text != "") {
                self.createUserAccount(usernameField.text!, password: passwordField.text!)
            } else {
                print("Error must enter username or password")
            }
        })
        
        // cancel btn
        let cancel = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        // textfields
        alert.addTextFieldWithConfigurationHandler { (usernameText) in
            
            usernameText.placeholder = "username"
        }
        alert.addTextFieldWithConfigurationHandler { (passwordText) in
            
            passwordText.placeholder = "password"
        }
        
        alert.addAction(create)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func createUserAccount(username: String, password: String) {
        
        // new record - CREATE
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context!)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(password, forKey: "password")
        
        // Save
        do {
            try context?.save()
            print("New Account for \(username) successfully created")
        } catch {
            print("Error Saving to Core Data")
        }
    }
}

