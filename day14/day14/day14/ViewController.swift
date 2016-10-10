//
//  ViewController.swift
//  day14
//
//  Created by YOUNG on 2016/10/10.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //IB
    @IBOutlet weak var emojiPickerView: UIPickerView!

    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func didClickGoButton(sender: AnyObject) {
        //变图案 动画
        let row = arc4random()%90 + 3
        emojiPickerView.selectRow(Int(row), inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(row), inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(row), inComponent: 2, animated: true)
        
        if dataArray1[emojiPickerView.selectedRowInComponent(0)] == dataArray2[emojiPickerView.selectedRowInComponent(1)] && dataArray2[emojiPickerView.selectedRowInComponent(1)] == dataArray3[emojiPickerView.selectedRowInComponent(2)]  {
             bingoLabel.text = "bingo"
        }else{
            bingoLabel.text = "no bingo"
        }
        
        //animation
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: .CurveLinear, animations: {
            
            
            self.goButton.bounds = CGRect(x: self.buttonBounds.origin.x, y: self.buttonBounds.origin.y, width: self.buttonBounds.size.width + 20, height: self.buttonBounds.size.height)
            
            }, completion: { (compelete: Bool) in
                
                UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: {
                    
                    self.goButton.bounds = CGRect(x: self.buttonBounds.origin.x, y: self.buttonBounds.origin.y, width: self.buttonBounds.size.width, height: self.buttonBounds.size.height)
                    
                    
                    
                    }, completion: nil)
                
        })
    }
    @IBOutlet weak var bingoLabel: UILabel!
    
    var imageArray : [String] = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    var buttonBounds : CGRect = CGRectZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<100 {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
        
        bingoLabel.text = ""
        
        buttonBounds = goButton.bounds
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
        goButton.layer.cornerRadius = 6
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
    }
}















