//
//  Company.swift
//  iNternships
//
//  Created by mohcine  on 10/5/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import Foundation


/// A class that represents a company I applied for, to make things simple we make everything a string
class Company {
    
    
    var id : Int
    var name : String
    var location : String
    var size : String
    var goal : String
    var soughtProfile : String
    var applicationMethod : String
    var contactName : String
    var contactMail : String
    var contactNumber : String
    var publicationDate : String
    var startDate : String
    var salary : String
    var comments : String
    
    
    
    /**
        Initializes a new companuy with the provided informations.
     
     
        - Parameters:
            - id: The id of the company in the servers's database
            - name: The name of the company
            - location: The address of the  company
            - goal: The purpose of the company, it's important for the company to have a precise project for me so that school validates the Internship
            - soughtProfile: What are the skills, specific details they're looking for in the new trainee
            - applicationMethod: Where did i find the job offer, how did i apply
            - contactName: The contact, with whoom i will be talking, during the hiring process
            - contactMail: The mail of the contact
            - contactNumber: The phone number of the contact
            - publicationDate: When the job offer was published
            - startDate: When does the company want the trainee to start
            - salary: Informations about the salary
            - comments: Any additional information about the job offer
     
     
        - Returns: A Company :)
     */
    init(company : NSDictionary) {
        
        
        self.id = Int (company["id"] as! String)!
        
        self.name = company["name"] as! String
        self.location = company["location"] as! String
        self.size = company["size"] as! String
        
        self.goal = company["goal"] as! String
        self.soughtProfile = company["sought_profile"] as! String
        self.applicationMethod = company["application_method"] as! String
        
        self.contactName = company["contact_name"] as! String
        self.contactMail = company["contact_mail"] as! String
        self.contactNumber = company["contact_number"] as! String
        
        self.publicationDate = company["publication_date"] as! String
        self.startDate = company["start_date"] as! String
        self.salary = company["salary"] as! String
        
        self.comments = company["comments"] as! String
        
    }
    
    ///Returns all the inforamtions about a company to make it easy for the Search Engine to look for informations inside companies data.
    func description () -> String {
        
        return  name + " " +
                location + " " +
                size + " " +
                goal + " " +
                soughtProfile + " " +
                applicationMethod + " " +
                contactName + " " +
                contactMail + " " +
                contactNumber + " " +
                publicationDate + " " +
                startDate + " " +
                salary + " " +
                comments
    }
    
    
    func humanFriendlyDescription () -> String {
        
        return  "name : " + name + "\n" +
                "location : " + location + "\n" +
                "size: " + size + "\n" +
                "goal: " + goal + "\n" +
                "soughtProfile: " + soughtProfile + "\n" +
                "applicationMethod: " + applicationMethod + "\n" +
                "contactName: " + contactName + "\n" +
                "contactMail: " + contactMail + "\n" +
                "contactNumber: " + contactNumber + "\n" +
                "publicationDate: " + publicationDate + "\n" +
                "startDate: " + startDate + "\n" +
                "salary: " + salary + "\n" +
                "comments: " + comments
    }
    
    
    
}


