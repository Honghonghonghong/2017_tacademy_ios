//
//  ViewController.swift
//  dynamicScene dynamics
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collition:UICollisionBehavior!
    
    var gesture: UIGestureRecognizer!
    
    var createdBox:UIView!
    
    func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        
    
//        redView.transform = redView.transform.scaledBy(x: gestur.scale, y: gestur.scale)
//        
//        gestur.scale = 1.0
        print(gesture.scale)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)
        
        collition = UICollisionBehavior()
        collition.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collition)
        
        //gesture = UIGestureRecognizer(target: self, action: #selector(handlePinch))
        //view.addGestureRecognizer(gesture)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let endPoint = touches.first!.location(in: self.view)
        struct boxSize {
            var w: CGFloat!
            var h: CGFloat!
        }
        let createdBoxSize = boxSize(w: 50, h:50)
        
        createdBox = UIView(frame: CGRect(x: endPoint.x, y: endPoint.y, width: createdBoxSize.w, height: createdBoxSize.h))
        createdBox.backgroundColor = UIColor.randomColor()
        
        self.view.addSubview(createdBox)
        
        gravity.addItem(createdBox)

        collition.addItem(createdBox)
        
        print("end",endPoint)
    }


}

