//
//  NewCompanyVC.swift
//  iNternships
//
//  Created by mohcine  on 10/6/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class NewCompanyVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

     
       // CompaniesRetriever.sharedInstance.createNewCompany("name=mozzilla%20Foundation%27s%20Basement&location=Miami,Florida%20Usa")
        
        
        
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add,target: self, action: #selector(NewCompanyVC.barButtonItemClicked(_:)) ), animated: true)
        
        
    }
    
     func barButtonItemClicked(sender: AnyObject) {
        
        let textField = tableView.viewWithTag(100) as! UITextField
        print(textField.text)
    }

    //TODO: On Click Take data from Views, makeString and give it to retriever so as it can send it to server
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        return cell!
        
    }
}
