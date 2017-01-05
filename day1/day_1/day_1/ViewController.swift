//
//  ViewController.swift
//  day_1
//
//  Created by Tacademy-Mac on 2017. 1. 2..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenView: UIView!
    
    var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = CGRect(x: 20, y: 40, width: 200, height: 200)
        redView = UIView(frame: frame)
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        
        
        
        
        // label
        
        let label1 = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 40))
        label1.text = "일반 레이블"
        label1.textColor = UIColor.red
        label1.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
        label2.text = "Marker Felt font Label"
        label2.font = UIFont(name: "Marker Felt", size: 20)
        view.addSubview(label2)
        
        let headlineLabel = UILabel(frame: CGRect(x: 50, y: 150, width: 0, height: 0))
        headlineLabel.text = "HeadlineText"
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        headlineLabel.sizeToFit()
        view.addSubview(headlineLabel)
        
        
        //
        let attributedStr = NSMutableAttributedString(string: "Attributed Text")
        //attributedStr.addAttri
        //
        let customFontLabel = UILabel(frame: CGRect(x: 50, y: 450, width: 300, height: 40))
        customFontLabel.text = "커스텀 폰트 입니다"
        customFontLabel.font = UIFont(name: "SeoulHangang", size: 25)
        view.addSubview(customFontLabel)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //by code
        redView.backgroundColor = UIColor.blue
        
        // by tag
        let view2017 = view.viewWithTag(2017)
        view2017?.backgroundColor = UIColor.yellow
        
        //find view by outlet
        greenView.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

