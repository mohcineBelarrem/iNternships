//
//  CompaniesMapVC.swift
//  iNternships
//
//  Created by mohcine  on 10/9/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit
import MapKit

class CompaniesMapVC: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func cancel(sender: AnyObject) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
