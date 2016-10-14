//
//  ViewController.swift
//  day20
//
//  Created by YOUNG on 2016/10/14.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data : [Model] = [Model(image:"qSrhpUW",title:"Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."),Model(image:"r0q8bh2",title: "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."),Model(image:"tumblr_muqax2L0Ad1qkegsbo1_500",title: "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."),Model(image:"tumblr_n9hyj3WPl21st5lhmo1_1280",title: "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."),Model(image:"tumblr_nk8k92X6N21sjh145o1_1280",title: "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return.")]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "coll")
        //flowLayout
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 70, 300)
        flowLayout.minimumInteritemSpacing = 20
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("coll", forIndexPath: indexPath) as! CollectionViewCell
        cell.model = data[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CollectionViewCell else{
            return;
        }
        cell.handleCellSelected()
        cell.backButtonTap = self.backButtonDidTouch
        
        //animation
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            cell.frame = collectionView.bounds
            }) { (_) in
            collectionView.scrollEnabled = false
        }
        
    }
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView.indexPathsForSelectedItems() else {
            return
        }
        
        collectionView.scrollEnabled = true
        collectionView.reloadItemsAtIndexPaths(indexPaths)
    }
}











