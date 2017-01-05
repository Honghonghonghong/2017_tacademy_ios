//
//  ViewController.swift
//  day1_1
//
//  Created by Tacademy-Mac on 2017. 1. 2..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var imageView3: UIImageView!
    var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image1 = UIImage(named: "image"){
            //imageView1.image = #imageLiteral(resourceName: "image1")
            imageView1.image = image1
        }
        
        if let image2 = UIImage(named: "image2/image2") {
            imageView2.image = image2
        }
        
        let urlStr = "http://lorempixel.com/400/200/cats/"
        if let url = URL(string: urlStr), let data = try? Data(contentsOf: url), let image = UIImage(data:data) {
            let imageView = UIImageView(image: image)
            imageView.center = CGPoint(x: view.center.x, y: view.center.y)
            //imageView.contentMode = .topLeft
            view.addSubview(imageView)
            
            imageView1.image = image
//            imageView1.contentMode = .center
//            imageView1.clipsToBounds = true
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

