//
//  ViewController.swift
//  day6
//
//  Created by YOUNG on 16/9/27.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    
    lazy var manager : CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    var geocoder : CLGeocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

    @IBAction func findMyPositon(sender: AnyObject) {
        
        
        manager.startUpdatingLocation()
    }
    
    //delegate 
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("-----")
        
        //let lati = locaiton?.coordinate.latitude
        //let longi = locaiton?.coordinate.longitude
        geocoder.reverseGeocodeLocation(manager.location!) { (place :[CLPlacemark]?, error : NSError?) in
            if error != nil{
                print(error)
                self.textLabel.text = error?.localizedDescription
            }else{
                guard let placeMrk = place?.first else{
                    return
                }
                print("\(placeMrk.locality)")
                self.textLabel.text = "\(placeMrk.locality)"
                
            }
        }
    }
    
}










