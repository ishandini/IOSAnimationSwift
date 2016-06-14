//
//  SpotifyViewController.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 6/12/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class SpotifyViewController: UIViewController {
    
    @IBOutlet var imgBackground: UIImageView!
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var lblMessage: UILabel!
    
    //constraints
    @IBOutlet var consBtnContinueToBottom: NSLayoutConstraint!
    @IBOutlet var consLblMessageToTop: NSLayoutConstraint!
    
    
    var messages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change status bar color to white
        // http://stackoverflow.com/questions/26956728/changing-the-status-bar-color-for-specific-viewcontrollers-using-swift-in-ios8
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        messages = ["Music for everyone", "millions of songs on Spotify. Play your favorites, discover new tracks, and build the perfect collection", "Find readymade playlists to match your mood, put together by music fans and experts", " Hear this week’s latest singles and albums, and check out what’s hot in the Top 50"]
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // hide navigationbar
        self.navigationController?.navigationBarHidden = true
        
        // hide some components in view
        imgBackground.alpha = 0
        btnContinue.alpha = 0
        lblMessage.alpha = 0
        
        // back to this view from another view, it should be default
        self.consBtnContinueToBottom.constant = 0
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // show navigationbar
        self.navigationController?.navigationBarHidden = false
        
        // change status bar color to default
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // show background image
        UIView.animateWithDuration(1.0) { 
            self.imgBackground.alpha = 1.0
        }
        
        
        // show continue button
        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.btnContinue.alpha = 1.0
            self.consBtnContinueToBottom.constant += 30
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            }) { (res) in
                
                //  show message
                self.showMarketingMessage(0)
        }
    }
    
    
    
    // MARK: Button Actions
    
    @IBAction func backPressed(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    // MARK: Show mesage
    
    func showMarketingMessage(position: Int) {
        
        var index = position
        let msg = messages[index]
        
        lblMessage.text = msg
        
        // lblMessage bring down for animation
        consLblMessageToTop.constant += 30
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        UIView.animateKeyframesWithDuration(10.0, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.10, animations: { 
                self.lblMessage.alpha = 0.5
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.10, relativeDuration: 0.05, animations: { 
                self.keyframeAnimation()
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.90, relativeDuration: 0.05, animations: {
                self.lblMessage.alpha = 0
            })
            
            
            
            }) { (res) in
                
                // completeion
                
                if index == self.messages.count - 1 {
                
                    index = 0
                    
                } else {
                
                    index += 1
                }
                
                self.showMarketingMessage(index)
        }
        
        
    }
    
    
    
    func keyframeAnimation() {
        
        UIView.animateWithDuration(1.0, delay: 0.0,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0,  options: [.CurveEaseOut],  animations: {
            
           self.consLblMessageToTop.constant -= 30
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
    }
    
    
    

}
