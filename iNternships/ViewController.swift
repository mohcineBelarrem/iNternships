//
//  ViewController.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let alertController = UIAlertController(title: "Security Check", message: "For Security reasons, enter the password.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler(nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            
            let alertTextField = alertController.textFields![0] as UITextField
            
            CompaniesRetriever.sharedInstance.password = alertTextField.text!
            
        }
        
        alertController.addAction(OKAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        
    }

    

    @IBAction func showAllCompanies(sender: AnyObject) {
        
       performSegueWithIdentifier("showAllCompaniesScene", sender: self)
    }
    
    @IBAction func addNewCompany(sender: AnyObject) {
        
        performSegueWithIdentifier("showNewCompanyScene", sender: self)
    }
    
}

