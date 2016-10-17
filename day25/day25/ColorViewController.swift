//
//  ColorViewController.swift
//  day25
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var tltleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseIn, animations: { () -> Void in
            
            self.view.backgroundColor = UIColor.blackColor()
            
            }, completion: nil )
        
        UIView.animateWithDuration(0.5, delay: 0.8, options: .CurveEaseOut, animations: { () -> Void in
            
            self.tltleLabel.textColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
            
            }, completion: nil)

    }

}
