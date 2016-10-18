//
//  PushViewController.swift
//  day28
//
//  Created by YOUNG on 2016/10/18.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    
    var movieDict : [String : String]!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    @IBOutlet weak var starsLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ratingLabel.layer.cornerRadius = ratingLabel.bounds.width/2
        ratingLabel.layer.masksToBounds = true
        if movieDict != nil {
            setupModels()
        }
    }
    
    func setupModels() {
        titleLabel.text = movieDict["Title"]!
        categoryLabel.text = movieDict["Category"]!
        descLabel.text = movieDict["Description"]!
        directorLabel.text = movieDict["Director"]!
        starsLabel.text = movieDict["Stars"]!
        ratingLabel.text = movieDict["Rating"]!
        iconImageView.image = UIImage(named: movieDict["Image"]!)
    }
    
}









