//
//  ViewController.swift
//  day15
//
//  Created by YOUNG on 2016/10/10.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var mask = CALayer()
    
    let backgroundLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        imageView.layer.mask = mask
        
        self.mask.contents = UIImage(named: "twitter logo mask")?.CGImage
        self.mask.contentsGravity = kCAGravityResizeAspect
        self.mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask.position = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2)
        mask.backgroundColor = UIColor.clearColor().CGColor
        
        //animation
        animateMask()
        
        
    }
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
     
        
        imageView.layer.mask = nil

    }
   
    
    
    func animateMask() {
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(CGRect: mask.bounds)
        let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask.addAnimation(keyFrameAnimation, forKey: "bounds")
        
    }
   


}

