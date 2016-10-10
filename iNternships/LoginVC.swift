//
//  LoginVC.swift
//  iNternships
//
//  Created by mohcine  on 10/10/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    
    @IBAction func login(sender: AnyObject) {
        
        let username = self.usernameTextField.text!
        let password = self.passwordTextField.text!
        
        
        if username.isEmpty  || password.isEmpty {
            
            (UIAlertView(title: "Empt field",
                         message: "U must fill all the infomations to log in",
                         delegate: nil ,
                         cancelButtonTitle: "Ok")).show()
            
        } else {
            
            //NSLog("Trying to login...")
            //TODO: ask the retriever to look for information
            let  ans = CompaniesRetriever.sharedInstance.login(username, password: password)
            
            
            if ans {
                
                print("access granted")
                
            } else {
                
                UIAlertView(title: "Error",
                            message: "Wronng username or password.",
                            delegate: nil,
                            cancelButtonTitle: "Ok").show()
            }
            
        }
        
        
    }
    
    //Methods to dismiss keyboard when finished with it
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Resiging first responder when textfield hits return
        textField.resignFirstResponder()
        return false
    }
    
    
}
