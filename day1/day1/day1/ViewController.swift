//
//  ViewController.swift
//  day1
//
//  Created by YOUNG on 16/9/25.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //constains
    @IBOutlet weak var blackViewHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var blueViewWidthCons: NSLayoutConstraint!
    
    //控件属性
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    //定义属性
    var time = 0.0
    var isPlaying = false
    var timer : NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //constains
        setupConstains()
        //UI
        setup()
        timeLabel.text = String(time)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
//MARK:constains
extension ViewController{
    private func setupConstains(){
        blackViewHeightCons.constant = UIScreen.mainScreen().bounds.height * 0.4
        blueViewWidthCons.constant = UIScreen.mainScreen().bounds.width * 0.45
    }
}

//MARK:事件监听
extension ViewController{
    private func setup(){
        
       playButton.addTarget(self, action: #selector(ViewController.didClickPlayButton), forControlEvents: .TouchUpInside)
        pauseButton.addTarget(self, action: #selector(ViewController.didClickPauseButton), forControlEvents: .TouchUpInside)
        resetButton.addTarget(self, action: #selector(ViewController.didClickResetButton), forControlEvents: .TouchUpInside)
        
    }
}

extension ViewController{
    @objc private func didClickPlayButton(){//点击play
        if isPlaying {
            return
        }
    
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.timerFunction), userInfo: nil, repeats: true)
    
        isPlaying = true
        playButton.enabled = false
        pauseButton.enabled = true
        
    }
    @objc private func didClickPauseButton(){//点击暂停
        timeLabel.text = String(format: "%.1f",time)
        timer.invalidate()
        playButton.enabled = true
        pauseButton.enabled = false
        isPlaying = false
    }
    
    //NSTimer
    @objc private func timerFunction(){
        
        time += 0.1
    
        timeLabel.text = String(format: "%.1f",time)
    }
    //点击reset
    @objc private func didClickResetButton(){
        time = 0.0
        timer.invalidate()
        timeLabel.text = String(time)
        isPlaying = false
        playButton.enabled = true
        pauseButton.enabled = true
    }
}
















