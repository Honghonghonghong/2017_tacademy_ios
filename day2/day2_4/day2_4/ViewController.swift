//
//  ViewController.swift
//  day2_4
//
//  Created by Tacademy-Mac on 2017. 1. 3..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayNumber: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func stepperChanged(_ sender: Any) {
        //let control = sender as! UIStepper
        let v = stepper.value
        displayNumber.text = String(v)
        slider.value = Float(v/100)
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let v = (sender.value * 100).rounded()
        displayNumber.text = String(v)
        stepper.value = Double(v)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

