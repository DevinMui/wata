//
//  ViewController.swift
//  wataios
//
//  Created by Jesse Liang on 8/15/15.
//  Copyright © 2015 Jesse Liang. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController ,NSURLConnectionDelegate{
    
    lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startConnection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConnection(){
        let urlPath: String = "http://192.168.1.122:3000/api/v1/"
        let url: NSURL = NSURL(string: urlPath)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func buttonAction(sender: UIButton!){
        startConnection()
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        //var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        do {
            let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            print(jsonResult)
        } catch let error as NSError {
            print(error)
        }
    }
}


    

        

    
 

    
    
    






