//
//  ViewController.swift
//  network openAPI
//
//  Created by Tacademy-Mac on 2017. 1. 11..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func search(keyword: String){
        let urlStr = ""
        
        let url = URL(string: urlStr)!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            let ret = String(data: data!, encoding: .utf8)
            print(ret)
        }.resume()
    }
    override func viewWillAppear(_ animated: Bool) {
        search(keyword: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

