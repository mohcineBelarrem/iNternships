//
//  AllCompaniesVC.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

///The Class that lists the companies loaded from server, and has a search Engine
class AllCompaniesVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating {

    @IBOutlet var tableView: UITableView!
    
    var companiesList : [Company]!
    var filtredCompaniesList : [Company]!
    
    var companyToBeDetailled : Company!
    
    var resultSearchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CompaniesRetriever.sharedInstance.loadCompaniesData()
        
        self.companiesList = CompaniesRetriever.sharedInstance.getCompaniesList()
        self.filtredCompaniesList = []
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
        
        let showMapButton = UIBarButtonItem(title: "Map", style: .Plain, target: self, action: #selector(showCompaniesMap))
        self.navigationItem.rightBarButtonItem  = showMapButton
        
    }
    
    func showCompaniesMap() {
        
        self.performSegueWithIdentifier("showCompaniesMapScene", sender: self)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.resultSearchController.active {
            return self.filtredCompaniesList.count
        } else {
            return self.companiesList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("companyCell")
        
        if self.resultSearchController.active {
            cell!.textLabel!.text = self.filtredCompaniesList[indexPath.row].name
        } else {
            cell!.textLabel!.text = self.companiesList[indexPath.row].name
        }
        return cell!
    }
    
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filtredCompaniesList.removeAll(keepCapacity: false)
        
        self.filtredCompaniesList = self.companiesList.filter(
            
            //closure header (params) -+ (return type) in
            
            { (ComparedCompany : Company) -> Bool in
                
                //closure body
                let query = searchController.searchBar.text
                
                //closure return
                let resultRange = ComparedCompany.description().rangeOfString(query!, options: NSStringCompareOptions.CaseInsensitiveSearch)
                
                return  resultRange != nil
                
        })
        
        self.tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if self.resultSearchController.active {
            self.companyToBeDetailled = self.filtredCompaniesList[indexPath.row]
        } else {
             self.companyToBeDetailled = self.companiesList[indexPath.row]
        }
        
        self.resultSearchController.active = false
        
        performSegueWithIdentifier("showCompanyDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showCompanyDetail" {
            
            let cdvc = segue.destinationViewController as! CompaniesDetailVC
            cdvc.companyToDetail = self.companyToBeDetailled
        }
        
    }
    
    
}
