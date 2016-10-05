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
    
    var directory : [Company]
    
    
    /**
        Initializes a new CompaniesDirectory which sole purpose is to store a list of companies.
     
        -Returns: A brand new Companies directory :)
     */
    init(){
            self.directory = []
    }
    
}