//
//  CompaniesRetriever.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import Foundation

///Controller responsible for fetching data form server as JSON and store it as classes of the Model
class CompaniesRetriever {
    
    static let sharedInstance = CompaniesRetriever()
    
    private var directory : CompaniesDirectory
    
    private init() {
        NSLog("Contacting Server...")
        self.directory = CompaniesDirectory()
    }
    
    
    ///Method responsible for loading JSON data, parsing it and loading it in the directory variable
    func loadCompaniesData() {
        
        NSLog("Fetching Data..")
        
        //Mocking the data for testing purposes
        //this simulates 3 companies loaded from the server
        let company1 : NSDictionary =  ["id":1,
                                        "name":"company 1",
                                        "location":"San Fransico",
                                        "size":"50 Employees",
                                        "goal":"Create the next Tinder",
                                        "sought_profile":"The next zucke",
                                        "application_method":"linkedin",
                                        "contact_name":"Sergei Alvaroff",
                                        "contact_mail":"s.alvaroff@cmpny1.com",
                                        "contact_number":"0120120120",
                                        "publication_date":"12/09/2016",
                                        "start_date":"01/01/2017",
                                        "salary":"1000000",
                                        "comments":""]
        
        let company2 : NSDictionary =  ["id":2,
                                        "name":"company 2",
                                        "location":"New york city ",
                                        "size":"Start up",
                                        "goal":"Create the next Tinder",
                                        "sought_profile":"The next zucke",
                                        "application_method":"linkedin",
                                        "contact_name":"Sergei Alvaroff",
                                        "contact_mail":"s.alvaroff@cmpny2.com",
                                        "contact_number":"0120120120",
                                        "publication_date":"12/09/2016",
                                        "start_date":"01/01/2017",
                                        "salary":"1000000",
                                        "comments":""]
        
        let company3 : NSDictionary =  ["id":3,
                                        "name":"company 3",
                                        "location":"London, UK",
                                        "size":"Mutli billion dollar corp",
                                        "goal":"Create the next Tinder",
                                        "sought_profile":"The next zucke",
                                        "application_method":"linkedin",
                                        "contact_name":"Sergei Alvaroff",
                                        "contact_mail":"s.alvaroff@cmpny3.com",
                                        "contact_number":"0120120120",
                                        "publication_date":"12/09/2016",
                                        "start_date":"01/01/2017",
                                        "salary":"1000000",
                                        "comments":""]
        
        self.directory.companiesList.append(Company(company: company1))
        self.directory.companiesList.append(Company(company: company2))
        self.directory.companiesList.append(Company(company: company3))
        
    }
    
    ///Accessor to get the list of companies downloaded from the server
    func getCompaniesList () -> [Company] {
        
        return self.directory.companiesList
    }
    
}