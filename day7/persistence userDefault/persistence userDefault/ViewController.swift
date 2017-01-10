//
//  ViewController.swift
//  persistence userDefault
//
//  Created by Tacademy-Mac on 2017. 1. 10..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let BIRTHDAY_KEY = "BIRHTDAY"
    let NOTI_KEY = "NOTI"
    
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var notiSwitch: UISwitch!
    
    @IBAction func saveSetting(_ sender: Any) {
        let setting = UserDefaults.standard
        
        setting.set(birthdayPicker.date, forKey: BIRTHDAY_KEY)
        setting.set(notiSwitch.isOn, forKey: NOTI_KEY)
        
        setting.synchronize()
    }
    
    
    @IBAction func restoreSetting(_ sender: Any) {
        let setting = UserDefaults.standard
        birthdayPicker.date = setting.object(forKey: BIRTHDAY_KEY) as! Date
        notiSwitch.isOn = setting.bool(forKey: NOTI_KEY)
    }
    
    override func viewDidLoad() {
        print(NSHomeDirectory())e
    }
}
