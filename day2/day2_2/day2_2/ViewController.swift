//
//  ViewController.swift
//  day2_2
//
//  Created by Tacademy-Mac on 2017. 1. 3..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Layout by code"
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = UIColor.lightGray
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let leftConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1.0, constant: 20)
        let topConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 20)
        label.superview!.addConstraints([leftConstraint, topConstraint])
        
        let widthConstraint = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300)
        
        label.addConstraint(widthConstraint)
        
        //
        func makeLabel(text: String) -> UILabel {
            let label = UILabel()
            label.text = text
            label.font = UIFont.systemFont(ofSize: 20)
            label.sizeToFit()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }
        //
        let label1 = makeLabel(text: "first L")
        let label2 = makeLabel(text: "S L")
        
        view.addSubview(label1)
        view.addSubview(label2)
        
        let views: [String:Any] = ["label1":label1, "label2":label2, "topGuide":self.topLayoutGuide]
        

        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat:"|-20-[label1]-20-[label2]", options:[], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[topGuide]-100-[label1][label2]", options:[], metrics: nil, views: views)
        
        label.superview!.addConstraints(horizontalConstraints)
        label.superview!.addConstraints(verticalConstraints)
        
//        let label1 = UILabel()
//        label1.text = "첫 번째 레이블"
//        label1.font = UIFont.systemFont(ofSize: 20)
//        self.view.addSubview(label1)
//        
//        let label2 = UILabel()
//        label2.text = "두 번째 레이블"
//        label2.font = UIFont.systemFont(ofSize: 20)
//        self.view.addSubview(label2)
//        
//        label1.translatesAutoresizingMaskIntoConstraints = false
//        label2.translatesAutoresizingMaskIntoConstraints = false
//        
//        // 비주얼 포맷 언어에서 사용하는 뷰
//        let views : [String:AnyObject] = ["label1":label1, "label2":label2, "topGuide":self.topLayoutGuide]
//        // 비주얼 포맷 언어로 제약조건 객체 생성
//        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat:"|-20-[label1]-20-[label2]", options:[], metrics: nil, views: views)
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[topGuide]-100-[label1][label2]", options:[], metrics: nil, views: views)
//        
//        // 부모뷰에 제약조건 추가
//        label.superview!.addConstraints(horizontalConstraints)
//        label.superview!.addConstraints(verticalConstraints)
        
        
    }
}

