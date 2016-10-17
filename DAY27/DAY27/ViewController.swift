//
//  ViewController.swift
//  DAY27
//
//  Created by YOUNG on 2016/10/17.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "这是\(indexPath.row)行"
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animations()
    }
    
    func animations() {
        
        self.tableView.reloadData()
        
        let cells  = tableView.visibleCells
        let tableViewHeight = tableView.bounds.height
        for cell in cells {
            
            cell.transform = CGAffineTransformMakeTranslation(0, tableViewHeight)
        }
        
        var index = 0
        
        for cell in cells{
            UIView.animateWithDuration(1.9, delay: 0.05 * Double(index), usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .CurveEaseInOut, animations: {
                cell.transform = CGAffineTransformIdentity
                }, completion: nil)
            
            index += 1
        }
        
    }
}










