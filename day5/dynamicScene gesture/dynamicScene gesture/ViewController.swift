//
//  ViewController.swift
//  dynamicScene gesture
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    var gesture: UIPinchGestureRecognizer!
    
    var isOn = true
    @IBAction func onoff(_ sender: UIButton) {
        // ????
        isOn = !isOn
        gesture.cancelsTouchesInView = isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        gesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        
        redView.addGestureRecognizer(gesture)
    }
    
    func handlePinch(_ gestur: UIPinchGestureRecognizer){
        
        switch gestur.state {
        case .began:
            print("began")
        case .changed:
            ()
        case .ended:
            print("ended")
        default:
            ()
        }
        //gesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        redView.transform = redView.transform.scaledBy(x: gestur.scale, y: gestur.scale)
        
        gestur.scale = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
    }
    
    
}

