//
//  ViewController.swift
//  day9
//
//  Created by YOUNG on 16/9/29.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var  imageBgView : UIImageView = UIImageView(image: UIImage(named:"Steve"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageBgView.bounds.size
        scrollView.addSubview(imageBgView)
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setZoomScaleFor(scrollView.frame.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
         recenterImage()
    }
    
    private func setZoomScaleFor(srollViewSize: CGSize) {
        
        let imageSize = imageBgView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
        
    }
    
    private func recenterImage() {
        
        let scrollViewSize = scrollView.frame.size
        let imageViewSize = imageBgView.bounds.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageBgView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
    }
}

