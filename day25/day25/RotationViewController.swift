//
//  RotationViewController.swift
//  day25
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.repeatCount = MAXFLOAT
        animation.duration = 2
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.removedOnCompletion = false
        
        icon1.layer.addAnimation(animation, forKey: "1")
         icon2.layer.addAnimation(animation, forKey: "1")
         icon3.layer.addAnimation(animation, forKey: "1")
         icon4.layer.addAnimation(animation, forKey: "1")
    }

   

}
