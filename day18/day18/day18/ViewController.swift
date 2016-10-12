//
//  ViewController.swift
//  day18
//
//  Created by YOUNG on 2016/10/12.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextViewDelegate{
    
    static let max =  140
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var textVIEW: UITextView!
    
    @IBOutlet weak var remainLabel: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textVIEW.delegate = self
        icon.layer.cornerRadius = 25
        icon.layer.masksToBounds = true
        remainLabel.text = "140"
        //notificaitons
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.keyBoardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.keyBoardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func keyBoardWillShow(noti : NSNotification){
        //print(noti.userInfo)
        guard let userInfo = noti.userInfo else{
            return
        }
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let transformHeight = frame.size.height
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: {
                self.bottomView.transform = CGAffineTransformMakeTranslation(0, -transformHeight)
                }, completion: nil)
            
        }else{
            
            self.bottomView.transform = CGAffineTransformMakeTranslation(0, -transformHeight)
        }
    }
    
    func keyBoardWillHide(noti: NSNotification){
        //print(noti.userInfo)
        guard let userInfo = noti.userInfo else{
            return
        }
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
      
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: { 
                self.bottomView.transform = CGAffineTransformIdentity
                }, completion: nil)
            
        }else{
            
            self.bottomView.transform = CGAffineTransformIdentity
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //delegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
       let str = textVIEW.text
        remainLabel.text = "\(140 - str.characters.count)"
        
        if range.length > 140 {
            return false
        }
        let newlength = textVIEW.text.characters.count + range.length
        
        return newlength < 140
    }
    
}



















//
//    - (BOOL)textView:(UITextView *)atextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    NSString *new = [textView.text stringByReplacingCharactersInRange:range withString:text];
//    NSInteger res = TEXT_MAXLENGTH-[new length];
//    if(res >= 0){
//    return YES;
//    }
//    else{
//    NSRange rg = {0,[text length]+res};
//    if (rg.length>0) {
//    NSString *s = [text substringWithRange:rg];
//    [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
//    }
//    return NO;
//    }
//    }










