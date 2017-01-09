//
//  ViewController.swift
//  multiScene modal
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalActionDelegate {
    @IBOutlet weak var textField: UITextField!
    
    func completeModalAction(_ data: String!) {
        self.textField.text = data
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MODAL_SEGUE", let vc = segue.destination as? ModalViewController {
            vc.delegate = self
            vc.data = textField.text
        }
    }

    @IBAction func showModal2(_ sender: Any) {
        self.performSegue(withIdentifier: "MODAL_SEGUE", sender: nil)
    }

    @IBAction func showModal3(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"MODAL_VC") as! ModalViewController
        vc.delegate = self
        vc.data = textField.text
        self.present(vc, animated: true, completion: nil)
    }

}

