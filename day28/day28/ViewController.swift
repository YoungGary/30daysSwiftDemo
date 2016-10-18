//
//  ViewController.swift
//  day28
//
//  Created by YOUNG on 2016/10/18.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var datas :NSMutableArray!
    
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
        
        loadDatas()
        
        setupSearchableContent()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    func loadDatas(){
        
        let path = NSBundle.mainBundle().pathForResource("MoviesData.plist", ofType: nil)
        
        datas = NSMutableArray(contentsOfFile: path!)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        let currentMovieInfo = datas[indexPath.row] as! [String: String]
        
        cell.titleLabel.text = currentMovieInfo["Title"]!
        cell.iconImageView.image = UIImage(named: currentMovieInfo["Image"]!)
        cell.descLabel.text = currentMovieInfo["Description"]!
        cell.pointLabel.text = currentMovieInfo["Rating"]!

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        performSegueWithIdentifier("tableView2ViewController", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else{
            return
        }
        if identifier == "tableView2ViewController"{
            let pushVC = segue.destinationViewController as! PushViewController
            pushVC.movieDict = datas[selectedIndex] as! [String: String]
        }
    }
    
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for i in 0...(datas.count - 1) {
            
            let movie = datas[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            //set the title
            searchableItemAttributeSet.title = movie["Title"]!
            
            //set the image
            let imagePathParts = movie["Image"]!.componentsSeparatedByString(".")
            searchableItemAttributeSet.thumbnailURL = NSBundle.mainBundle().URLForResource(imagePathParts[0], withExtension: imagePathParts[1])
            
            // Set the description.
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.componentsSeparatedByString(", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.componentsSeparatedByString(", ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            
            searchableItems.append(searchableItem)
            
            CSSearchableIndex.defaultSearchableIndex().indexSearchableItems(searchableItems) { (error) -> Void in
                if error != nil {
                    print(error?.localizedDescription)
                }
            }
        }
        
    }

    override func restoreUserActivityState(activity: NSUserActivity) {
        
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selectedIndex = Int(selectedMovie.componentsSeparatedByString(".").last!)!
                performSegueWithIdentifier("tableView2ViewController", sender: self)
            }
        }
    }
}





















