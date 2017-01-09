//
//  DetailViewController.swift
//  multiScene masterDetail
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var urlStr: String!
    var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = URL(string: "http://"+urlStr){
            let request = URLRequest(url: url)
            print("URL Loading with ", request)
            
            webView.load(request)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
