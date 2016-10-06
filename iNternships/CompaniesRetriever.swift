//
//  CompaniesRetriever.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import Foundation
import UIKit

///Controller responsible for fetching data form server as JSON and store it as classes of the Model
class CompaniesRetriever {
    
    static let sharedInstance = CompaniesRetriever()
    
    var password : String!
    
    private var directory : CompaniesDirectory
    
    private init() {
        NSLog("Contacting Server...")
        self.directory = CompaniesDirectory()
    }
    
    
    

    
    ///Method responsible for loading JSON data, parsing it and loading it in the directory variable
    func loadCompaniesData() {
       
        do {
            let url = NSURL(string: "http://testarea.belarrem.com/companies.php?password=\(password)")
            
            let data = NSData(contentsOfURL: url!)
            
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            let response = json["response"] as! String
            
            if response == "200" {
                
                let companies = json["companies"] as! [NSDictionary]
                    for company in companies {
                        
                        self.directory.companiesList.append(Company(company: company))
                    }
                }
        
            else {
                
                UIAlertView(title: "Error", message: "Wrong Password, ReLaunch the app and try again", delegate: nil, cancelButtonTitle: "Ok").show()
            }
            
        } catch {
            print("error serializing JSON: \(error)")
        }

        
    }
    
    ///Accessor to get the list of companies downloaded from the server
    func getCompaniesList () -> [Company] {
        
        return self.directory.companiesList
    }
    
}


