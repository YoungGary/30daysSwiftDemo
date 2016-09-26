//
//  ViewController.swift
//  day4
//
//  Created by YOUNG on 16/9/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    //viewControllers
    let leftVC : LaftViewController = LaftViewController(nibName: "LaftViewController", bundle: nil)
    let centerVC : CenterViewController = CenterViewController(nibName: "CenterViewController", bundle: nil)
    let rightVC : RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.pagingEnabled = true
        
        addChildViewController(leftVC)
        scrollView.addSubview(leftVC.view)
        leftVC.didMoveToParentViewController(self)
        
        addChildViewController(centerVC)
        scrollView.addSubview(centerVC.view)
        centerVC.didMoveToParentViewController(self)
        
        addChildViewController(rightVC)
        scrollView.addSubview(rightVC.view)
        rightVC.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.size.height)
        
        
        
        var centerViewFrame: CGRect = centerVC.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerVC.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightVC.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        centerVC.view.frame = rightViewFrame
    }

    


}

