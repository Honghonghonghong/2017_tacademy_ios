//
//  ViewController.swift
//  hw2_UpDownGame
//
//  Created by Yanghongsun on 2017. 1. 8..
//  Copyright © 2017년 YHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progresssView: UIProgressView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var upDownLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmentOfstate: UISegmentedControl!
    
    var inputValue:Int!
    var randomValue: Int!
    
    struct State {
        var current = 0
        var total = 0
        var progress: Float! {
            if total == 0 {
                return 1
            } else {
                return Float(current)/Float(total)
            }
        }
    }
    
    var state = State()
    
    var stateValue: Float{
        get {
            return self.stateValue
        }
        set {
            progresssView.setProgress(self.stateValue, animated: true)
        }
    }
    enum segmentIndex:Int {
        case oneToTen, oneToFifty, oneToHundred
    }
    @IBAction func inputNum(_ sender: UITextField) {
        if let value = sender.text{
            inputValue = Int(value)
        } else {
            inputValue = nil
        }
    }
    @IBAction func endInputNum() {
//        textField.resignFirstResponder()
        
        if let i = inputValue {
            if i > randomValue{
                upDownLabel.text = "Down"
            } else if i < randomValue{
                upDownLabel.text = "Up"
            } else {
                upDownLabel.text = "정답"
                popDialog(title: "정답", btnTitle: "다시하기")
                initGame(selectedSegment: segmentOfstate.selectedSegmentIndex)
            }
            
            state.current += 1
            
            progresssView.setProgress(state.progress, animated: true)
            stateLabel.text = "\(state.current)/\(state.total)"
            
            if state.current == state.total {
                popDialog(title: "실패 답은 \(randomValue!) 입니다", btnTitle: "다시하기")
                initGame(selectedSegment: segmentOfstate.selectedSegmentIndex)

            }
        }
        textField.text = nil
    }
    @IBAction func beginInputNum(_ sender: UITextField) {
//        sender.text = nil
    }

    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        initGame(selectedSegment: sender.selectedSegmentIndex)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGame(selectedSegment: segmentOfstate.selectedSegmentIndex)
    }
    
    func initGame(selectedSegment:Int){
        let suffix = " 사이의 값 입력"
        var currentState:String!
        var maxGameValue: UInt32!
        
        state.current = 0
        
        switch selectedSegment {
        case segmentIndex.oneToTen.rawValue:
            state.total = 5
            maxGameValue = 10
            currentState = "1~10"
        case segmentIndex.oneToFifty.rawValue:
            state.total = 10
            maxGameValue = 50
            currentState = "1~50"
        case segmentIndex.oneToHundred.rawValue:
            state.total = 20
            maxGameValue = 100
            currentState = "1~100"
        default:
            ()
        }
        
        upDownLabel.text = currentState + suffix
        randomValue = Int(arc4random_uniform(maxGameValue))

        randomValue = Int(arc4random_uniform(10)) + 1
        print(randomValue)
        
        progresssView.setProgress(state.progress, animated: true)
        stateLabel.text = "\(state.current)/\(state.total)"
    }
    
    func popDialog(title: String, btnTitle btnT: String) {
        let dialog = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: btnT, style: .default, handler: nil))
        present(dialog, animated: true, completion: nil)
    }
}

