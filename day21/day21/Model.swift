//
//  model.swift
//  day21
//
//  Created by YOUNG on 2016/10/15.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class Model: NSObject {
    var image : String = ""
    var title : String = ""
    
    init(image : String, title : String) {
        super.init()
        self.image = image
        self.title = title
    }
}
