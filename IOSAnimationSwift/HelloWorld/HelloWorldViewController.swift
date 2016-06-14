//
//  HelloWorldViewController.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 6/11/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class HelloWorldViewController: UIViewController {
    
    // components
    @IBOutlet var lblHelloWorld: UILabel!
    @IBOutlet var lblMyFirstAnimation: UILabel!
    @IBOutlet var lblSeeYouNextTime: UILabel!
    
    
    // constraints
    @IBOutlet var consLblHelloWorldToTop: NSLayoutConstraint!
    @IBOutlet var consLblMyFirstAnimationToHelloWorld: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        consLblHelloWorldToTop.constant -= view.bounds.height
        consLblMyFirstAnimationToHelloWorld.constant += view.bounds.height*2
        
        lblSeeYouNextTime.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Helloworld label, background
        UIView.animateWithDuration(1.5) {
            self.consLblHelloWorldToTop.constant += self.view.bounds.height
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            self.view.backgroundColor = UIColor.yellowColor()
        }
        
        UIView.animateWithDuration(2.0, animations: { 
            self.consLblMyFirstAnimationToHelloWorld.constant -= self.view.bounds.height*2
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            }) { (res) in
                // completion
                
            self.labelAnimateCompletion()
        }
        
        
    }
    
    
    func labelAnimateCompletion() {
        
        UIView.animateWithDuration(1.0, animations: {
            
            self.view.backgroundColor = UIColor.blackColor()
            self.lblHelloWorld.alpha = 0
            self.lblMyFirstAnimation.alpha = 0

            }) { (res) in
                
                self.lblSeeYouNextTime.alpha = 1
        }
    }

 

}
