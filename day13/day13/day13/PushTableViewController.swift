//
//  PushTableViewController.swift
//  day13
//
//  Created by YOUNG on 2016/10/9.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class PushTableViewController: UITableViewController {
    
    
    let dataCount : Int = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellcell")
        tableView.backgroundColor = UIColor.blackColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animationForCell()
    }
    
    func animationForCell(){
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        
        for i in cells {
            let cell  = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        for j in cells{
            let cell =  j as UITableViewCell
            UIView.animateWithDuration(1, delay: 0.05 * Double(index) , usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            index += 1
        }
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataCount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellcell", forIndexPath: indexPath)
        cell.textLabel?.text = "this is 第\(indexPath.row)行--"
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = randomCellColor(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func randomCellColor(index : Int) -> UIColor {
        let itemCount = dataCount - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    

}









