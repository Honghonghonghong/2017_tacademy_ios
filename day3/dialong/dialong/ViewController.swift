//
//  ViewController.swift
//  dialong
//
//  Created by Tacademy-Mac on 2017. 1. 4..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let actBtn = UIButton(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
    let dialog = UIAlertController(title: "title", message: nil, preferredStyle: .alert)
    let passwordDialog = UIAlertController(title: "input password", message: "message", preferredStyle: .alert)
    let passwordBtn = UIButton(frame: CGRect(x: 20, y: 100, width: 40, height: 40))
    
    enum tags: Int {
        case actBtn = 1, passwordBtn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn
        actBtn.setTitle("ACT", for: .normal)
        actBtn.setTitleColor(UIColor.black, for: .normal)
        actBtn.addTarget(self, action: #selector(handleClickByCode(_:)), for: .touchUpInside)
        actBtn.tag = 1
        view.addSubview(actBtn)
        
        passwordBtn.setTitle("PASSWORD", for: .normal)
        passwordBtn.setTitleColor(UIColor.blue, for: .normal)
        passwordBtn.addTarget(self, action: #selector(handleClickByCode(_:)), for: .touchUpInside)
        passwordBtn.sizeToFit()
        passwordBtn.tag = 2
        view.addSubview(passwordBtn)
        
        //dialog
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action : UIAlertAction) -> Void in
            print("취소 선택")
        }
        dialog.addAction(cancelAction)
        dialog.addTextField(configurationHandler: nil)
        
        //passwordDialog
        passwordDialog.addAction(cancelAction)
        
        
        
    }
    
//    let dialog = UIAlertController(title: "비밀 번호 입력", message: nil, preferredStyle: .alert)
//    
//    
//    let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
//        let userInput = dialog.textFields![0]
//        self.inputLabel.text = userInput.text
//    }
//    dialog.addAction(okAction)
//    
//    
//    let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
//        print("취소 선택")
//        self.inputLabel.text = "취소 선택"
//    }
//    dialog.addAction(cancelAction)
//    
//    dialog.addTextField(configurationHandler: { (textField : UITextField) in
//    // 키보드 설정
//    textField.keyboardType = .numberPad
//    textField.isSecureTextEntry = true
//    
//    })
//    
//    self.present(dialog, animated: true, completion: nil)
    func handleClickByCode(_ sender: UIButton) {
        switch sender.tag {
        case tags.actBtn.rawValue:
            self.present(dialog, animated: true, completion: nil)
        case tags.passwordBtn.rawValue:
            self.present(passwordDialog, animated: true, completion: nil)
        default:
            ()
        }
    }

}

