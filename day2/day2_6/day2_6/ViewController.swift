//
//  ViewController.swift
//  day2_6
//
//  Created by Tacademy-Mac on 2017. 1. 3..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UILabel!
    
    @IBAction func editingChanged(_ sender: UITextField) {
        displayText.text = sender.text
    }
    @IBAction func editingDidBegin() {
        displayText.textColor = UIColor.blue
    }
    @IBAction func didEndoo(_ sender: UITextField) {
    }
    @IBAction func editingDidEnd() {
        displayText.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textField = UITextField(frame: CGRect(x: 20, y: 300, width: 200, height: 50))
        textField.placeholder = "by Code"
        textField.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

