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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionsHeaders.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.companyTextComponents.contains((indexPath as NSIndexPath).section) {
            return 100.0
        } else {
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionsHeaders[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        var cell : UITableViewCell
        
        if self.companyTextComponents.contains((indexPath as NSIndexPath).section) {
            
          cell = tableView.dequeueReusableCell(withIdentifier: "companyDetailLargeCell", for: indexPath)
          let textView =  cell.viewWithTag(101) as! UITextView
           textView.text = self.companyToDetail.toArray()[(indexPath as NSIndexPath).section]
            
        } else {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "companyDetailSmallCell", for: indexPath)
            let label = cell.viewWithTag(102) as! UILabel
            label.text = self.companyToDetail.toArray()[(indexPath as NSIndexPath).section]
        }
        
        return cell
    }
    
  
 
}
