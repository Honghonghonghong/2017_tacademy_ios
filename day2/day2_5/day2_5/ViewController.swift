//
//  ViewController.swift
//  day2_5
//
//  Created by Tacademy-Mac on 2017. 1. 3..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct color {
        var R = 0.0
        var G = 0.0
        var B = 0.0
        var A = 1.0
        
        func convertUIColor() -> UIColor {
            return UIColor(red: CGFloat(R), green: CGFloat(G), blue: CGFloat(B), alpha: CGFloat(A))
        }
    }
    
    var myColor = color()

    @IBOutlet weak var colorBoard: UIView!
    
    @IBAction func changeColor(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            myColor.R = Double(sender.value)
        case 2:
            myColor.G = Double(sender.value)
        case 3:
            myColor.B = Double(sender.value)
        default:()
        }
        
        colorBoard.backgroundColor = myColor.convertUIColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorBoard.backgroundColor = myColor.convertUIColor()
    }
}

