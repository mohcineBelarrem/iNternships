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
        
        let showMapButton = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(showCompaniesMap))
        self.navigationItem.rightBarButtonItem  = showMapButton
        
    }
    
    func showCompaniesMap() {
        
        self.performSegue(withIdentifier: "showCompaniesMapScene", sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.resultSearchController.isActive {
            return self.filtredCompaniesList.count
        } else {
            return self.companiesList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell")
        
        if self.resultSearchController.isActive {
            cell!.textLabel!.text = self.filtredCompaniesList[(indexPath as NSIndexPath).row].name
        } else {
            cell!.textLabel!.text = self.companiesList[(indexPath as NSIndexPath).row].name
        }
        return cell!
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.filtredCompaniesList.removeAll(keepingCapacity: false)
        
        self.filtredCompaniesList = self.companiesList.filter(
            
            //closure header (params) -+ (return type) in
            
            { (ComparedCompany : Company) -> Bool in
                
                //closure body
                let query = searchController.searchBar.text
                
                //closure return
                let resultRange = ComparedCompany.description().range(of: query!, options: NSString.CompareOptions.caseInsensitive)
                
                return  resultRange != nil
                
        })
        
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.resultSearchController.isActive {
            self.companyToBeDetailled = self.filtredCompaniesList[(indexPath as NSIndexPath).row]
        } else {
             self.companyToBeDetailled = self.companiesList[(indexPath as NSIndexPath).row]
        }
        
        self.resultSearchController.isActive = false
        
        performSegue(withIdentifier: "showCompanyDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "showCompanyDetail" {
            
            let cdvc = segue.destination as! CompaniesDetailVC
            cdvc.companyToDetail = self.companyToBeDetailled
        }
        
    }
    
    
}
