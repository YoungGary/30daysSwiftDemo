//
//  ScaleViewController.swift
//  day25
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.repeatCount = 1
        animation.duration  = 3
        animation.removedOnCompletion = false
        
        icon.layer.addAnimation(animation, forKey: "animaiton")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
