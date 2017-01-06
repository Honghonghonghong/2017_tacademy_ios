//
//  MyView.swift
//  drawing
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let str:NSString = "글자 그리rl"
        let attr = [NSForegroundColorAttributeName:UIColor.blue,
                    NSFontAttributeName:UIFont.systemFont(ofSize: 30)]
        str.draw(at: CGPoint(x:10, y:10), withAttributes: attr)
        
        if let image = UIImage(named: "image.jpg") {
            image.draw(in: CGRect(x: 50, y: 50, width: 100, height: 100))
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("coder")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("frame")
    }

}
