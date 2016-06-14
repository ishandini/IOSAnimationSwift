//
//  LoginViewController.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 6/13/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    // constraints
    @IBOutlet var consTxtEmailToRight: NSLayoutConstraint!
    @IBOutlet var consTxtPasswordToRight: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // move to left, beyond the view
        consTxtEmailToRight.constant += view.frame.width
        consTxtPasswordToRight.constant += view.frame.width
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Email
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: [], animations: {
            
            self.consTxtEmailToRight.constant -= self.view.frame.width
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()

            
            }) { (res) in
                // completion
        }
        
        // Password
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: [], animations: {
            
            self.consTxtPasswordToRight.constant -= self.view.frame.width
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            
        }) { (res) in
            // completion
        }
        
        
    }

}
