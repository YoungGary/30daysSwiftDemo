//
//  PushTableViewController.swift
//  day16
//
//  Created by YOUNG on 2016/10/10.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

protocol sendTitleDelegate{
    
   func sendTitle(title:String)
}


class PushTableViewController: UITableViewController {
    
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    
    var currentTitle : String = ""
    
    var delegate : sendTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.blackColor()
        tableView.separatorStyle = .None
        tableView.tableFooterView = UIView()
        
        
        
    }
    
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellcell", forIndexPath: indexPath)
        
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = (menuItems[indexPath.row] == currentTitle) ? UIColor.whiteColor() : UIColor.grayColor()
        cell.backgroundColor = UIColor.blackColor()
        cell.selectionStyle = .None
      
        return cell
    }
    
    //点击cell反传值
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 
        delegate?.sendTitle(menuItems[indexPath.row])
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
