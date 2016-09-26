//
//  TableViewCell.swift
//  day3
//
//  Created by YOUNG on 16/9/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
}
class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imageBgView: UIImageView!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var introLabel: UILabel!
    
    var video : Video?{
        
        didSet{
            guard let video = video else{
                return
            }
            imageBgView.image = UIImage(named: video.image)
            timeLabel.text = video.source
            introLabel.text = video.title
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    @IBAction func didClickPlayButton(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("button", object: nil, userInfo: nil)
        
    }
    

}
