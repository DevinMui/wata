//
//  ViewController.swift
//  wataios
//
//  Created by Jesse Liang on 8/15/15.
//  Copyright © 2015 Jesse Liang. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON

class ViewController: UIViewController ,NSURLConnectionDelegate{
    
    lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://intense-shore-4027.herokuapp.com/api/v1/water_usages"
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                let json = JSON(data: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                }
            }
        }
        let camera = GMSCameraPosition.cameraWithLatitude(37.7749295,
            longitude: -122.41941550000001, zoom: 6)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(37.7749295, -122.41941550000001)
        marker.title = "San Francisco"
        marker.snippet = "United States"
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func parseJSON(json: JSON) {
        //var objects = [String]()
        for result in json.arrayValue {
            let moisture = result["moisture"].stringValue
            _ = ["moisture": moisture]
            
            //objects.append(obj)
        }
        
        //tableView.reloadData()
    }
        
    }



    

        

    
 

    
    
    






