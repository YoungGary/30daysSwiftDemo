//
//  CollectionViewCell.swift
//  day20
//
//  Created by YOUNG on 2016/10/14.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    var backButtonTap : (()->Void)?
    
    var model : Model?{
        didSet{
            guard let model = model else{
                return
            }
            imageView.image = UIImage(named: model.image)
            titleLabel.text = model.title
        }
    }
    
    func handleCellSelected() {
        backButton.hidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.backgroundColor = UIColor.whiteColor()
        backButton.hidden = true
        backButton.addTarget(self, action: #selector(CollectionViewCell.backButtonDidTouch), forControlEvents: .TouchUpInside)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(CollectionViewCell.tapGestureHandler(_:)))
//        imageView.addGestureRecognizer(tap)
        
        
    }
    
//    func tapGestureHandler(tap: UIGestureRecognizer){
//        guard let backButtonTapped = backButtonTap else{
//            return
//        }
//        backButtonTapped()
//    }
    
    func backButtonDidTouch(){
        guard let backButtonTapped = backButtonTap else{
            return
        }
        backButtonTapped()
    }
    
    
}







