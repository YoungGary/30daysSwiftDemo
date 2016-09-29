//
//  ViewController.swift
//  day7
//
//  Created by YOUNG on 16/9/29.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    var data = [String]()
    
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = favoriteEmoji
        
        refreshControl = refresh
        
        refresh.addTarget(self, action: #selector(ViewController.refreshing), forControlEvents: .ValueChanged)
        refresh.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        refresh.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        refresh.tintColor = UIColor.whiteColor()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60.0
        
        
        
        self.tableView.tableFooterView = UIView()
    }
    
    @objc private func refreshing (){
        data = newFavoriteEmoji
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return  .LightContent
    }

}


extension ViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        
        return cell 
    }
}











