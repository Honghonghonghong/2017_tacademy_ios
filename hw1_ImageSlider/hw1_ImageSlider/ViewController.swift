//
//  ViewController.swift
//  hw1_ImageSlider
//
//  Created by Yanghongsun on 2017. 1. 3..
//  Copyright © 2017년 YHS. All rights reserved.
//

import UIKit

enum tags: Int {
    case leftBtn = 100, rightBtn
}

class ViewController: UIViewController {
    
    let imageAccessor = NearImageAccessor(withinFolder: "images")
    
    //outlet
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // action
    @IBAction func touchBtn(_ sender: UIButton)
    {
        switch sender.tag
        {
        case tags.leftBtn.rawValue:
            guard imageAccessor.moveToLeft() else {
                return
            }
            
        case tags.rightBtn.rawValue:
            guard imageAccessor.moveToRight() else {
                return
            }

        default:()
        }
        
        changeBtnState(left: imageAccessor.isOnTheLeft, right: imageAccessor.isOnTheRight)
        imageView.image = imageAccessor.pointedImage
        
    }
    func changeBtnState(left: Bool?, right: Bool?){
        if let l = left {
            if l {
                leftBtn.setImage(#imageLiteral(resourceName: "left_1") ,for: .normal)
            } else {
                leftBtn.setImage(#imageLiteral(resourceName: "left_2") ,for: .normal)
            }
        }
        if let r = right {
            if r {
                rightBtn.setImage(#imageLiteral(resourceName: "right_1"), for: .normal)
            } else {
                rightBtn.setImage(#imageLiteral(resourceName: "right_2"), for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//image = UIImage(named: "images/image2.jpg")
        changeBtnState(left: imageAccessor.isOnTheLeft, right: imageAccessor.isOnTheRight)
        
        if let image = imageAccessor.pointedImage {
            imageView.image = image
        }
        
    }
}


