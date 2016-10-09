//
//  NewCompanyVC.swift
//  iNternships
//
//  Created by mohcine  on 10/6/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class NewCompanyVC: UIViewController {
    
    var scrollView: UIScrollView!
    var humanReadableCompanyComponents : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CompaniesRetriever.sharedInstance.createNewCompany("name=mozzilla%20Foundation%27s%20Basement&location=Miami,Florida%20Usa")
        
        
        self.humanReadableCompanyComponents = CompaniesRetriever.sharedInstance.getHumanReadableCompanyComponents()
        
        
        addUIEleements(self.humanReadableCompanyComponents.count)
        
    }
    
    
    @IBAction func addCompany(sender: AnyObject) {
        
        var newCompanyInformations = [String]()
        
        for i in 0...self.humanReadableCompanyComponents.count-1 {
            
            let label = scrollView.viewWithTag(200+i) as! UITextField
            
            if(label.text!.isEmpty) {
                
                UIAlertView(title: "Empty Informations",
                            message: "You need to fill all the Informations",
                            delegate: nil,
                            cancelButtonTitle: "Ok").show()
                
                return
            }
            
            newCompanyInformations.append(label.text!)
            
        }
        
        CompaniesRetriever.sharedInstance.createNewCompany(newCompanyInformations)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelCreation(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addUIEleements(numberOfElements : Int){
        
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 64, self.view.frame.width, self.view.frame.height))
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + CGFloat(80 * numberOfElements+64)-self.view.frame.height)
        self.scrollView.showsVerticalScrollIndicator = true
        self.scrollView.scrollEnabled = true
        self.view.addSubview(self.scrollView)
        
        for i in 0...numberOfElements-1 {
            
            let container = UIView(frame: CGRect(x: 0, y: 80*i, width: Int(self.view.frame.width), height: 80))
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
            label.text = self.humanReadableCompanyComponents[i]
            label.font = UIFont(name: "Futura", size: 16)
            
            
            let textField = UITextField(frame: CGRect(x: 10, y: 50, width: container.frame.width-10, height: 30))
            textField.placeholder = "Type the \(self.humanReadableCompanyComponents[i])"
            textField.tag = 200+i
            textField.font = UIFont(name: "Futura", size: 16)
            textField.textColor = UIColor(red: CGFloat(0), green: CGFloat(150/255.0), blue: CGFloat(1.0), alpha: CGFloat(1.0))
            textField.clearButtonMode = UITextFieldViewMode.WhileEditing
            
            
            container.addSubview(label)
            container.addSubview(textField)
            self.scrollView.addSubview(container)
        }
    }
    
    
     
    
}
