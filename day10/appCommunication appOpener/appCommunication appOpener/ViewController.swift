//
//  ViewController.swift
//  appCommunication appOpener
//
//  Created by Tacademy-Mac on 2017. 1. 13..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueOne: UITextField!
    @IBOutlet weak var valueTwo: UITextField!
    
    @IBAction func openOtherApp(_ sender: Any) {
        var urlComponent = URLComponents(string: "myScheme://com.vanillastep/")!
        // 퍼센트 인코딩도 해준다.
        let query1 = URLQueryItem(name: "value1", value: valueOne.text)
        let query2 = URLQueryItem(name: "value2", value: valueTwo.text)
        
        urlComponent.queryItems = [query1, query2]
        
        let url = urlComponent.url!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options:[:], completionHandler: nil)
        }
        else {
            print("Can not open")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

