//
//  ViewController.swift
//  appArchitecture todoWithMVC
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var userInputChecker : UserInputChecker!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TODO_CELL", for: indexPath)
        let todo = TodoManager.shared.todo(at: indexPath.row)!
        cell.textLabel?.text = todo
        
        return cell
    }
    
    
    //?
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        TodoManager.shared.remove(at: indexPath.row)
    }
    
    @IBAction func addTodo(_ sender: UIBarButtonItem) {
        let dialog = UIAlertController(title: "추가", message: nil, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action : UIAlertAction) in
                    let todo = dialog.textFields![0].text!
                    TodoManager.shared.add(todo: todo)
                }
        
        okAction.isEnabled = false
        dialog.addAction(okAction)
        
        userInputChecker.okAction = okAction
        
        dialog.addTextField{(textField) in
            textField.placeholder = "4자 이상 입력하세요"
            textField.addTarget(self.userInputChecker, action: #selector(self.userInputChecker.checkUserInput(_:)), for: .editingChanged)
        }
        self.show(dialog, sender: sender)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func handleTodoAddNoti(noti: Notification) {
        if let index = noti.userInfo?["INDEX"] as? Int {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //셀렉터를 이용한 감시
        NotificationCenter.default.addObserver(self, selector: #selector(handleTodoAddNoti), name: AddCompletionNotification, object: nil)
        //클로저를 이용한 감시
        NotificationCenter.default.addObserver(forName: DeleteCompletionNotification, object: nil, queue: nil){
            (noti: Notification) in
            
            if let index = noti.userInfo?["INDEX"] as? Int {
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
    }
    
    class UserInputChecker : NSObject {
        var okAction : UIAlertAction!

        func checkUserInput(_ textField : UITextField) {
            if (textField.text?.characters.count)! > 3 {
                okAction.isEnabled = true
            }
            else {
                okAction.isEnabled = false
            }
        }
    }
}


//    // 모델 변경 감지를 위한 감시객체 등록

//        // 클로저를 이용한 알림 감시
//        NotificationCenter.default.addObserver(forName: DeleteCompletionNotification, object: nil, queue: nil) { (noti : Notification) in
//            // 할일 삭제된 인덱스를 얻어서 테이블 뷰에서 삭제
//            if let index = noti.userInfo?["INDEX"] as? Int {
//                let indexPath = IndexPath(row: index, section: 0)
//                self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//        }
//    }
//    
//    // 모델 변경 감시 객체 해제
//    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 사용자 입력 체크
//        userInputChecker = UserInputChecker()
//    }
//    
//    // 사용자 키 입력 체크
//    class UserInputChecker : NSObject {
//        var okAction : UIAlertAction!
//        
//        func checkUserInput(_ textField : UITextField) {
//            if (textField.text?.characters.count)! > 3 {
//                okAction.isEnabled = true
//            }
//            else {
//                okAction.isEnabled = false
//            }
//        }
//    }
//}
//
