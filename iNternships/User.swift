//
//  User.swift
//  iNternships
//
//  Created by mohcine  on 10/10/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var id : String
    var name : String
    var password : String
    
    init (user : NSDictionary) {
        
        self.id = user["id"]  as! String
        self.name = user["name"] as! String
        self.password = user["password"] as! String
    }
    
}
