//
//  ViewController.swift
//  day5
//
//  Created by YOUNG on 16/9/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data : [Model] = [Model(title:"Hello there, i miss u.", image: "hello"),Model(title:"🐳🐳🐳🐳🐳", image : "dudu"),Model(title:"Training like this, #bodyline",image: "bodyline"),Model(title:"I'm hungry, indeed.", image: "wave"),Model(title:"Dark Varder, #emoji", image: "darkvarder"),Model(title:"I have no idea, bitch", image : "hhhhh")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.dataSource = self
        let nib  = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "cell")
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = UIScreen.mainScreen().bounds.width * 0.65
        let height = collectionView.frame.size.height
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = .Horizontal
        
        
    }
}


extension ViewController :UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.model = data[indexPath.item]
        
        
        return cell
    }
}









