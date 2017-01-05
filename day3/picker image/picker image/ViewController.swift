//
//  ViewController.swift
//  picker image
//
//  Created by Tacademy-Mac on 2017. 1. 4..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var imageData = [UIImage]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageData.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 180.0
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 200.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        image.image = imageData[row]
        return image
    }
    

    @IBAction func touchBtn(_ sender: UIButton) {
        let r = Int(arc4random()) % imageData.count
        
        pickerView.selectRow(r, inComponent: 0, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageData = [UIImage(named:"img0")!,
                     UIImage(named:"img1")!,
                     UIImage(named:"img2")!,
                     UIImage(named:"img3")!,
                     UIImage(named:"img4")!,
                     UIImage(named:"img5")!,
                     UIImage(named:"img6")!]
    }

}

