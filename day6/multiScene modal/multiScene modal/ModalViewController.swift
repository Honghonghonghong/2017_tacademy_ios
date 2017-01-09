//
//  ModalViewController.swift
//  multiScene modal
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

protocol ModalActionDelegate: class {
    func completeModalAction(_ data: String!)
}

class ModalViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: ModalActionDelegate!
    
    var data: String!
    
    override func viewWillAppear(_ animated: Bool) {
        textField.text = data
    }
    
    @IBAction func handleDone(_ sender: Any) {
        if delegate != nil{
            let data = textField.text
            delegate.completeModalAction(data)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // 키보드 감추기
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
    }
}
