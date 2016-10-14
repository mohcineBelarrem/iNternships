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
    var sectionsHeaders : [String]!
    var companyTextComponents : [Int]!

    override func viewDidLoad() {
        super.viewDidLoad()

       self.navigationItem.title = self.companyToDetail.name
       self.sectionsHeaders = CompaniesRetriever.sharedInstance.getHumanReadableCompanyComponents()
       self.companyTextComponents = CompaniesRetriever.sharedInstance.getCompaniesTextComponents()
        
        print("\(companyToDetail.coordinates)")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionsHeaders.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.companyTextComponents.contains(indexPath.section) {
            return 100.0
        } else {
            return 44.0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionsHeaders[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        var cell : UITableViewCell
        
        if self.companyTextComponents.contains(indexPath.section) {
            
          cell = tableView.dequeueReusableCellWithIdentifier("companyDetailLargeCell", forIndexPath: indexPath)
          let textView =  cell.viewWithTag(101) as! UITextView
           textView.text = self.companyToDetail.toArray()[indexPath.section]
            
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier("companyDetailSmallCell", forIndexPath: indexPath)
            let label = cell.viewWithTag(102) as! UILabel
            label.text = self.companyToDetail.toArray()[indexPath.section]
        }
        
        return cell
    }
    
  
 
}
