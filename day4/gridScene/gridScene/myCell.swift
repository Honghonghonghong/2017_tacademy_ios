//
//  myCell.swift
//  gridScene
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

protocol MyCellDelegate: class {
    func check(name: String)
}

class myCell:UICollectionViewCell {
    
    weak var delegate: MyCellDelegate!
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    var name: String!
    
    @IBAction func touchDownBtn(_ sender: UIButton) {
        btn.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5)
    }
    @IBAction func touchUpOutsideBtn(_ sender: UIButton) {
        btn.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0)
    }
    @IBAction func touchBtn(_ sender: UIButton) {
        btn.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0)
        delegate.check(name: name)

    }
    
}
