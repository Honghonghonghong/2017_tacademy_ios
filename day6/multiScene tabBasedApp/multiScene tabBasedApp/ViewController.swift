//
//  ViewController.swift
//  multiScene tabBasedApp
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.sharedString = textField.text
        
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        label.text = "Scene \(self.tabBarController!.selectedIndex)"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        textField.text = appDelegate.sharedString
        
    }


}

