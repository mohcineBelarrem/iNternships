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
        
    }


    @IBAction func showAllCompanies(sender: AnyObject) {
        
       performSegueWithIdentifier("showAllCompaniesScene", sender: self)
    }
    
    @IBAction func addNewCompany(sender: AnyObject) {
        
        performSegueWithIdentifier("showNewCompanyScene", sender: self)
    }
    
}

