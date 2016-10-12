//
//  PushViewController.swift
//  day17
//
//  Created by YOUNG on 2016/10/11.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {

    //left
    @IBOutlet weak var text: UIImageView!
    
    @IBOutlet weak var quote: UIImageView!
    
    @IBOutlet weak var chat: UIImageView!
    //right
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var link: UIImageView!
    
    @IBOutlet weak var audio: UIImageView!
    //button
    @IBOutlet weak var dismissButton: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
         
    }

   
    
    @IBAction func didClickButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    

}
