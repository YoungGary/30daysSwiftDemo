//
//  ViewController.swift
//  day17
//
//  Created by YOUNG on 2016/10/11.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let transitionManager = TransitionAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let pushVC = segue.destinationViewController as! PushViewController
        
        pushVC.transitioningDelegate = self.transitionManager
        
        
        
    }


    

}

