//
//  ViewController.swift
//  day13
//
//  Created by YOUNG on 2016/10/9.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataCount : Int = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(FirstTableViewCell.self, forCellReuseIdentifier: "first")
        tableView.backgroundColor = UIColor.blackColor()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animationCell()
    }
    func randomCellColor(index : Int) -> UIColor{
        let itemCount = dataCount - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)

    }
    
    func animationCell(){
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        
        let tableHeight = tableView.bounds.height
        
        for index in cells {
            let cell : UITableViewCell = index as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                
                }, completion: nil)
            
            index += 1
        }
    }
}

extension ViewController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("first", forIndexPath: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor  = randomCellColor(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("pushpush", sender: nil)
    }
}

