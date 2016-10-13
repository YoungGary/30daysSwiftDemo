//
//  ViewController.swift
//  day19
//
//  Created by YOUNG on 2016/10/13.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    lazy var refreshController = UIRefreshControl()
    
    var customView :UIView! = nil
    
    var labelsArray: Array<UILabel> = []
    
    var isAnimating = false
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        //refresh
        refreshController.backgroundColor = UIColor.clearColor()
        refreshController.tintColor = UIColor.clearColor()
        tableView.addSubview(refreshController)
        
        setupRefreshControl()
        
    }
    
    func setupRefreshControl(){
        let refreshContents = NSBundle.mainBundle().loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents[0] as! UIView
        customView.frame = refreshController.bounds
        
       for i in 0 ..< customView.subviews.count {
            
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
            
        }
        
        refreshController.addSubview(customView)
    }
    
    func startAnimatiion1(){
        isAnimating = true
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: {
            self.labelsArray[self.currentIndex].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }) { (_) in
            UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: {
                self.labelsArray[self.currentIndex].transform = CGAffineTransformIdentity
                }, completion: { (_) in
                    
                    self.currentIndex += 1
                    
                    if self.currentIndex < self.labelsArray.count{
                        self.startAnimatiion1()
                    }else{
                         self.currentIndex = 0
                        self.startAnimatiion2()
                       
                    }
                    
            })
        }
        
    }
    
    func startAnimatiion2(){
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: {
            self.labelsArray[self.currentIndex].transform = CGAffineTransformMakeScale(1.5, 1.5)
        }) { (_) in
            UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: {
                self.labelsArray[self.currentIndex].transform = CGAffineTransformIdentity
                }, completion: { (_) in
                    
                    self.currentIndex += 1
                    
                    if self.currentIndex < self.labelsArray.count{
                        self.startAnimatiion2()
                    }else{
                        self.isAnimating = false
                        self.currentIndex = 0
                        self.refreshController.endRefreshing()
                       
                    }
                    
            })
        }
    }
    
    
    
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if isAnimating == false {
            startAnimatiion1()
        }
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    

}











