//
//  ViewController.swift
//  network webView
//
//  Created by Tacademy-Mac on 2017. 1. 11..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var myView2: UIWebView!
    @IBOutlet weak var myView: UIView!
    var webView: WKWebView!
    
    @IBOutlet weak var textField: UITextField!
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("error")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("err")
    }
    
    @IBAction func didEndOnexit(_ sender: Any) {
        let urlStr = textField.text!
        //loadWebview(urlStr)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: self.myView.frame, configuration: config)
        self.myView.addSubview(webView)
        
        
        let urlStr = "http://google.com"
        let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encoded)!
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
}

