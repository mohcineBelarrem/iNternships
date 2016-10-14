//
//  CompaniesDirectory.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import Foundation


/// Basicly a class that will store a list of Companies
class CompaniesDirectory {
    
    var companiesList : [Company]
    
    var companyComponents : [String]
    var humanReadableCompanyCompnents : [String]
    
    var companiesTextComponents : [Int]!
    
    var currentUser : User!
    
    
    /**
        Initializes a new CompaniesDirectory which sole purpose is to store a list of companies.
     
        -Returns: A brand new Companies directory :)
     */
    init(){
        
        self.companiesList = []
        self.companyComponents = ["company_name",
                                  "location",
                                  "size",
                                  "goal",
                                  "sought_profile",
                                  "application_method",
                                  "application_date",
                                  "contact_name",
                                  "contact_mail",
                                  "contact_number",
                                  "publication_date",
                                  "start_date",
                                  "salary",
                                  "comments","coordinates"]
        
        self.humanReadableCompanyCompnents = ["Company Name",
                                              "Location",
                                              "Size",
                                              "Goal",
                                              "Sought Profile",
                                              "Application Method",
                                              "Application Date",
                                              "Contact Name",
                                              "Contact Mail",
                                              "Contact Number",
                                              "Publication Date",
                                              "Start Date",
                                              "Salary",
                                              "Comments",
                                              "Coordinates"]
        
        self.companiesTextComponents = [1,3,4,13]
        
    }
    
}