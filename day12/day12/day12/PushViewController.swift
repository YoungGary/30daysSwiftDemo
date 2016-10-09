//
//  PushViewController.swift
//  day12
//
//  Created by YOUNG on 2016/10/9.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var centerAlignCons: NSLayoutConstraint!
    
    @IBOutlet weak var passWordCenterCons: NSLayoutConstraint!
    
    @IBOutlet weak var loginButtonCenterCons: NSLayoutConstraint!
    
    
    @IBAction func didClickBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignCons.constant -= UIScreen.mainScreen().bounds.width
        passWordCenterCons.constant -= UIScreen.mainScreen().bounds.width
        loginButtonCenterCons.constant -= UIScreen.mainScreen().bounds.width
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //username
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseInOut, animations: {
            
            self.centerAlignCons.constant += UIScreen.mainScreen().bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        //password
        UIView.animateWithDuration(1, delay: 0.2, options: .CurveEaseInOut, animations: {
            self.passWordCenterCons.constant += UIScreen.mainScreen().bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        //login
        UIView.animateWithDuration(1, delay: 0.4, options: .CurveEaseInOut, animations: {
            self.loginButtonCenterCons.constant += UIScreen.mainScreen().bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    
    @IBAction func didiClickLoginButton(sender: AnyObject) {
        
        let bounds = self.loginButton.bounds
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 3.0, initialSpringVelocity: 9.0, options: [], animations: {
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.enabled = false
            }) { (_) in
                self.loginButton.enabled = true
        }
    }
    
}









