//
//  ViewController.swift
//  day3
//
//  Created by YOUNG on 16/9/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UITableViewController {
    
    var data = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveNotifications()
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}


extension ViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.video = data[indexPath.row]
        
        
        return cell
    }
}

extension ViewController{
    private func receiveNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.didClickPlayButton), name: "button", object: nil)
    }
    
    @objc private func didClickPlayButton(){
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        playerView = AVPlayer(URL: url)
        playViewController.player = playerView
        
        presentViewController(playViewController, animated: true, completion: nil)
        
    }
}














