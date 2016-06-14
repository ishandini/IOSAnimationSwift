//
//  QuoteViewController.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 6/11/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    
    @IBOutlet var lblQuote: UILabel!
    @IBOutlet var lblAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide labels
        fadeOut()
    }

    func fadeOut() {
        lblQuote.alpha = 0
        lblAuthor.alpha = 0
    }
    
    
    func fadeIn() {
        lblQuote.alpha = 1
        lblAuthor.alpha = 1
    }
    
    
    // MARK: Button Action
    
    @IBAction func generatePressed(sender: AnyObject) {
        // label hide
        fadeOut()
        
        let dataService = DataService()
        
        dataService.getQuoteData({ (quote, author) in
            
        UIView.animateWithDuration(0.5, animations: { 
            
            // label show and change background color
            self.fadeIn()
            self.view.backgroundColor = self.getRandomColor()
            
            // show data
            self.lblQuote.text = "\(quote)"
            
            if let aAuthor = author {
                
                self.lblAuthor.text = "- \(aAuthor)"
                
            }
            
            if author == "" {
                
                self.lblAuthor.text = "- Unknown"
            }
            
        })
            // End animation
            
            }) { (error) in
                
                // show error message
                self.fadeIn()
                self.lblQuote.text = "\(error)"
                self.lblAuthor.text = ""
                
        }
        
       
    }
    
    
    func getRandomColor() -> UIColor {
    
        let randomRed: CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        let randomGreen: CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        let randomBlue: CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))
        
        return UIColor(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 1.0)
    }
    

}
