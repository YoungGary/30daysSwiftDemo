//
//  OpacityViewController.swift
//  day25
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animateWithDuration(2.0) {
            self.imageView.alpha = 0
        }
    }

    
    

  

}
