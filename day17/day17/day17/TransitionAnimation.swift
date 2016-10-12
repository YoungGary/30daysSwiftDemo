//
//  TransitionAnimation.swift
//  day17
//
//  Created by YOUNG on 2016/10/11.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class TransitionAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    
    
    private var ispresented  = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.ispresented = true
        return self
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.ispresented = false
        return self
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        let menuViewController = !self.ispresented ? screens.from as! PushViewController : screens.to as! PushViewController
        let bottomViewController = !self.ispresented ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        containerView!.addSubview(bottomView)
        containerView!.addSubview(menuView)
        
        if (self.ispresented) {
            
            self.offStageMenuController(menuViewController)
            
        }
        
        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.ispresented){
                
                self.onStageMenuController(menuViewController)
                
            } else {
                
                self.offStageMenuController(menuViewController)
                
            }
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                
        })
        
    }
    
    func offset(amount : CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStageMenuController(pushVC : PushViewController){
        pushVC.view.alpha = 0
        
        let topRowOffset  : CGFloat = 200
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset  : CGFloat = 100
        
        /*
         @IBOutlet weak var text: UIImageView!
         
         @IBOutlet weak var quote: UIImageView!
         
         @IBOutlet weak var quote: UIImageView!
         //right
         @IBOutlet weak var photo: UIImageView!
         
         @IBOutlet weak var link: UIImageView!
         
         @IBOutlet weak var audio: UIImageView!
         
         */
        pushVC.text.transform = offset(-topRowOffset)
        pushVC.quote.transform = offset(-middleRowOffset)
        pushVC.quote.transform = offset(-bottomRowOffset)
        
        pushVC.photo.transform = offset(topRowOffset)
        pushVC.link.transform = offset(middleRowOffset)
        pushVC.audio.transform = offset(bottomRowOffset)
        
        
    }
    
    func onStageMenuController(pushVC : PushViewController) {
         pushVC.view.alpha = 1
        
        pushVC.text.transform = CGAffineTransformIdentity
        pushVC.quote.transform = CGAffineTransformIdentity
        pushVC.quote.transform = CGAffineTransformIdentity
        
        pushVC.photo.transform = CGAffineTransformIdentity
        pushVC.link.transform = CGAffineTransformIdentity
        pushVC.audio.transform = CGAffineTransformIdentity
    }
    
}










