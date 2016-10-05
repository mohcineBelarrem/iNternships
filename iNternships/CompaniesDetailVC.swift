//
//  CompaniesDetailVC.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class CompaniesDetailVC: UITableViewController {
    
    var companyToDetail : Company!

    override func viewDidLoad() {
        super.viewDidLoad()

       self.navigationItem.title = self.companyToDetail.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 450.0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("companyDetailCell", forIndexPath: indexPath)

        let textView = cell.viewWithTag(101) as! UITextView
        textView.text = self.companyToDetail.humanFriendlyDescription()
        
        return cell
    }
    
  
 
}
