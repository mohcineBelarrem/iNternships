//
//  NewCompanyVC.swift
//  iNternships
//
//  Created by mohcine  on 10/6/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class NewCompanyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
        CompaniesRetriever.sharedInstance.createNewCompany("name=charika")
    }

    //TODO: On Click Take data from Views, makeString and give it to retriever so as it can send it to server

}
