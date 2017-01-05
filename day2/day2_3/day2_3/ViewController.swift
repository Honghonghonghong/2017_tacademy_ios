//
//  ViewController.swift
//  day2_3
//
//  Created by Tacademy-Mac on 2017. 1. 3..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var sketchbook: UIView!
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            sketchbook.backgroundColor = UIColor.red
        case 2:
            sketchbook.backgroundColor = UIColor.green
        case 3:
            sketchbook.backgroundColor = UIColor.blue
        default:()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

