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
    
    func getCompanyComponents() -> [String] {
        
     return self.directory.companyComponents
    }
    
    func getHumanReadableCompanyComponents() -> [String] {
        
        return self.directory.humanReadableCompanyCompnents
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
    
    func createNewCompany(params:String){
        
        // Do any additional setup after loading the view.
        
        let myUrl = NSURL(string: "http://testarea.belarrem.com/newcompany.php?password=\(password)");
        
        let request = NSMutableURLRequest(URL:myUrl!)
        
        request.HTTPMethod = "POST"// Compose a query string
        
        let postString = params;
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("response = \(response)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    // Now we can access value of First Name by its key
                    let message = parseJSON["message"] as? String
                    print("message: \(message)")
                    
                    
                    
                    
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}


