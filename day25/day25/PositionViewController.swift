//
//  PositionViewController.swift
//  day25
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animation1()
    }

    func animation1(){
        UIView.animateWithDuration(0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: { () -> Void in
            
            self.firstView.center.x = self.view.bounds.width - self.firstView.center.x
            self.firstView.center.y = self.firstView.center.y + 30
            self.secondView.center.x = self.view.bounds.width -  self.secondView.center.x
            self.secondView.center.y = self.secondView.center.y + 30
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseOut, animations: { () -> Void in
            
            self.setHeight(180)
            
            
            }, completion: nil )
        
       
        
    }
    
    func setHeight(height: CGFloat) {
        
        var frame: CGRect = self.thirdView.frame
        frame.size.height = height
        
        self.thirdView.frame = frame
    }
    
   

}













