//
//  ViewController.swift
//  picker
//
//  Created by Tacademy-Mac on 2017. 1. 4..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBAction func valueChanged(_ sender: UIDatePicker) {
        let date = sender.date
        
        print(date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        let dateStr = dateFormatter.string(from: date)
        
        print(dateStr)
    }
    
    func countDown(_ timer: Timer){
        timerPicker.countDownDuration -= 60
        
    }
//    @IBAction func startTimer(sender: AnyObject) {
//        let interval : TimeInterval = 1
//        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(countDown(_:)), userInfo: nil, repeats: true)
//    }
    var timer: Timer!
    
    override func viewDidAppear(_ animated: Bool) {
        let interval: TimeInterval = 1
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(countDown(_:)), userInfo: nil, repeats: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

