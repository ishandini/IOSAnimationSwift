//
//  File.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 6/11/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import UIKit

class DataService {

    let randomQuoteUrl = NSURL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
    
    func getQuoteData(completion: (quote: String, author: String?) -> (), failed: (error: NSString) -> () ) {
    
        NSURLSession.sharedSession().dataTaskWithURL(randomQuoteUrl) { (data: NSData?, respose: NSURLResponse?, error: NSError?) in
            
            do {
            
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                
                let aQuote = jsonDictionary["quoteText"] as! String
                let aAuthor = jsonDictionary["quoteAuthor"] as! String
                
               dispatch_async(dispatch_get_main_queue(), {
            
                 completion(quote: aQuote, author: aAuthor)
               })
                
            } catch {
            
                print("Invalid json data \(error)")
                dispatch_async(dispatch_get_main_queue(), {
                    
                     failed(error: "Try Again !")
                })
               
            }
            
            
        }.resume()
    }
}
