//
//  ViewController.swift
//  drawing
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = MyView()
        myView.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        myView.backgroundColor = UIColor.red
        self.view.addSubview(myView)
        
    }

}
