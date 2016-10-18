//
//  TableViewCell.swift
//  day28
//
//  Created by YOUNG on 2016/10/18.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var pointLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        pointLabel.layer.cornerRadius = pointLabel.bounds.width/2
        pointLabel.layer.masksToBounds = true
        
    }

   
    
}
