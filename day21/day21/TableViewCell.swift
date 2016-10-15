//
//  TableViewCell.swift
//  day21
//
//  Created by YOUNG on 2016/10/15.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    
    var model : Model?{
        didSet{
            guard let model = model else{
                return
            }
            titleLable.text = model.title
            imageV.image = UIImage(named: model.image)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
