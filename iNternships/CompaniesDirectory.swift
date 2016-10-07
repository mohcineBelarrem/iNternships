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
    
    
    /**
        Initializes a new CompaniesDirectory which sole purpose is to store a list of companies.
     
        -Returns: A brand new Companies directory :)
     */
    init(){
        
        self.companiesList = []
        self.companyComponents = ["name",
                                  "location",
                                  "size",
                                  "goal",
                                  "sought_profile",
                                  "application_method",
                                  "contact_name",
                                  "contact_mail",
                                  "contact_number",
                                  "pubilcation_date",
                                  "start_date",
                                  "salary",
                                  "comments"]
        
        self.humanReadableCompanyCompnents = ["Name",
                                              "Location",
                                              "Size",
                                              "Goal",
                                              "Sought Profile",
                                              "Application Method",
                                              "Contact Name",
                                              "Contact Mail",
                                              "Contact Number",
                                              "Pubilcation Date",
                                              "Start Date",
                                              "Salary",
                                              "Comments"]
        
    }
    
}