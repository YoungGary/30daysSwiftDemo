//
//  SecondViewController.swift
//  DAY27
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.alpha = 0
        imageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .CurveEaseInOut, animations: {
            self.imageView.alpha = 1.0
            self.imageView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }

}
