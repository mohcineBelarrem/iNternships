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
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Hello World
    

    @IBAction func showAllCompanies(sender: AnyObject) {
        
       performSegueWithIdentifier("showAllCompaniesScene", sender: self)
    }
    
    @IBAction func addNewCompany(sender: AnyObject) {
        
        NSLog("Add new company")
    }
    
}

