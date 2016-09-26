//
//  CollectionViewCell.swift
//  day5
//
//  Created by YOUNG on 16/9/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var model : Model?{
        didSet{
            guard let model = model else{
                return
            }
            imageBgView.image = UIImage(named: model.image)
            titleLabel.text = model.title
        }
    }
    //xib property
    
    @IBOutlet weak var imageBgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }

}
