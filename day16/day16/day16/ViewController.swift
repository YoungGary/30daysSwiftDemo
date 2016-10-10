//
//  ViewController.swift
//  day16
//
//  Created by YOUNG on 2016/10/10.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,sendTitleDelegate,MenuTransitionManagerDelegate{
    
    let transitionManager = TransitionAnimationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Everyday Moments"
        tableView.backgroundColor = UIColor.blackColor()
        tableView.separatorStyle = .None
        tableView.tableFooterView = UIView()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = "这是\(indexPath.row)行"
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.lightGrayColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let pushVC = segue.destinationViewController as! PushTableViewController
        pushVC.delegate = self
        pushVC.transitioningDelegate = transitionManager
        pushVC.currentTitle = navigationItem.title!
        
        transitionManager.delegate = self
    }
    
    func sendTitle(title: String) {
        navigationItem.title = title
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}



