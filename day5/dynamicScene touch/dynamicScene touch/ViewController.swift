//
//  ViewController.swift
//  dynamicScene touch
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ballImage: UIImageView!
    
    var holdingImage = false
    var distance = CGPoint(x: 0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: touch.view)
        
        if ballImage.frame.contains(point){
            holdingImage = true
            ballImage.transform = ballImage.transform.scaledBy(x: 1.1, y: 1.1)
            
            distance.x = ballImage.center.x - point.x
            distance.y = ballImage.center.y - point.y
        }
        else {
            holdingImage = false
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if holdingImage {
            let touch = touches.first!
            let point = touch.location(in: touch.view)
            
            let pointOfBallCenter = CGPoint(x: point.x + self.distance.x, y: point.y + self.distance.y)
            
            // print(pointOfBallCenter)
            
            ballImage.center = pointOfBallCenter
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if holdingImage {
            ballImage.transform = CGAffineTransform.identity
            holdingImage = false
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("cancel")
    }
}

