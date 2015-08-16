//
//  JSONTableViewController.swift
//  wataios
//
//  Created by Jesse Liang on 8/16/15.
//  Copyright © 2015 Jesse Liang. All rights reserved.
//

import UIKit

class JSONTableViewController: UITableViewController {
    let kurl = "http://192.168.1.122:3000/api/v1/waterusages/"
    
    var moisture:NSData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let URLRequest = NSURLRequest(URL: NSURL(string: kurl)!)
        
        
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse>=nil
        
        var jsonSource: NSData = NSURLConnection.sendAsynchronousRequest(URLRequest, returningResponse: response, error:nil)
        
        
        self.moisture = (NSJSONSerialization.JSONObjectWithData(jsonSource, options: NSJSONReadingOptions.MutableContainers, error: nil)as NSDictionary)["results"] as NSMutableArray
        




}
    