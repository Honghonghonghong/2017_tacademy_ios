//
//  ViewController.swift
//  scrollView
//
//  Created by Tacademy-Mac on 2017. 1. 4..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView0: UIImageView!
    var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "image.jpg")
        
        //imageView0.image = image
        imageView = UIImageView(image: image)
        scrollView.contentSize = image!.size
        
        scrollView.minimumZoomScale = scrollView.frame.size.width / image!.size.width
        scrollView.maximumZoomScale = 2.0
        
        scrollView.insertSubview(imageView, at: 1)
    }

}

