//
//  ViewController.swift
//  day21
//
//  Created by YOUNG on 2016/10/15.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let datas : [Model] = [Model(image : "1",title:"1"),Model(image : "2",title:"2"),Model(image : "3",title:"3"),Model(image : "4",title:"4"),Model(image : "5",title:"5"),Model(image : "6",title:"6"),Model(image : "7",title:"7"),Model(image : "8",title:"8"),Model(image : "1",title:"1"),Model(image : "2",title:"2"),Model(image : "3",title:"3"),Model(image : "4",title:"4"),Model(image : "5",title:"5"),Model(image : "6",title:"6"),Model(image : "7",title:"7"),Model(image : "8",title:"8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        //nib
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.model = datas[indexPath.row]
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    //delegate --- editing
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        
        let delete = UITableViewRowAction(style: .Normal, title: "🗑\nDelete") { action, index in
            print("Delete button tapped")
        }
        
        delete.backgroundColor = UIColor.grayColor()
        
        
        let share = UITableViewRowAction(style: .Normal, title: "🤗\nShare") { (action: UITableViewRowAction!, indexPath: NSIndexPath) -> Void in
            
            let firstActivityItem = self.datas[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        
        share.backgroundColor = UIColor.redColor()
        
        
        let download = UITableViewRowAction(style: .Normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blueColor()
        
        return [download, share, delete]
    }

}











