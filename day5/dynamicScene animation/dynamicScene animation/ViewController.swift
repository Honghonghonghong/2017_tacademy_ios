//
//  ViewController.swift
//  dynamicScene animation
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let blackView = UIView(frame: redView.frame)
        blackView.backgroundColor = UIColor.black
        
        UIView.animate(withDuration: 2.0, animations: {
            self.redView.frame = (CGRect(x: 100, y: 100, width: 100, height: 100))
        }, completion: {
            (finished) in
            UIView.animate(withDuration: 1.0, animations: {
                self.redView.backgroundColor = UIColor.blue
                
                UIView.transition(from: self.redView, to: blackView, duration: 1.0, options: .transitionCurlUp, completion: nil)
            }, completion: nil)
        })
        
    }
    
}

