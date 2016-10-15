//
//  NewCompanyVC.swift
//  iNternships
//
//  Created by mohcine  on 10/6/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class NewCompanyVC: UIViewController,UITextFieldDelegate {
    
    var scrollView: UIScrollView!
    var humanReadableCompanyComponents : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,selector: #selector(NewCompanyVC.keyboardWillShow(_:)),
                                                         name: NSNotification.Name.UIKeyboardWillShow,
                                                         object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(NewCompanyVC.keyboardWillHide(_:)),
                                                     name: NSNotification.Name.UIKeyboardWillHide,
                                                     object: nil)

        
        self.humanReadableCompanyComponents = CompaniesRetriever.sharedInstance.getHumanReadableCompanyComponents()
        addUIElements(self.humanReadableCompanyComponents.count)
      
        let addCompanyButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCompany))
        self.navigationItem.rightBarButtonItem  = addCompanyButton
    }
    
    func addCompany() {
        
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
        
        self.performSegue(withIdentifier: "unwindNewCompany", sender: self)
    }
    
    
    func addUIElements(_ numberOfElements : Int){
        
        self.scrollView = UIScrollView(frame: CGRect(x: 0,y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,
                                             height: self.view.frame.height + CGFloat(80 * numberOfElements)-self.view.frame.height)
        self.scrollView.showsVerticalScrollIndicator = true
        self.scrollView.isScrollEnabled = true
        //self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag
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
            textField.clearButtonMode = UITextFieldViewMode.whileEditing
            textField.delegate = self
            
            if i <= numberOfElements - 2 {
            textField.returnKeyType = UIReturnKeyType.next
            } else {
                textField.returnKeyType = UIReturnKeyType.done
            }
                
            container.addSubview(label)
            container.addSubview(textField)
            self.scrollView.addSubview(container)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       let max = 200 + self.humanReadableCompanyComponents.count - 1
        
       let tag = textField.tag
       
        if  tag >= 200 && tag < max {
            self.scrollView.viewWithTag(tag+1)?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scrollView.endEditing(true)
    }
    
    
    func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
        let numberOfElements =  self.humanReadableCompanyComponents.count
            
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,
                                                 height: 1.2*keyboardSize.height + self.view.frame.height + CGFloat(80 * numberOfElements)-self.view.frame.height)
        }
        
        
    }
    
    func keyboardWillHide(_ notification: Notification) {
       
        let numberOfElements =  self.humanReadableCompanyComponents.count
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,
                                             height: self.view.frame.height + CGFloat(80 * numberOfElements)-self.view.frame.height)
        
    }
    
    
}
