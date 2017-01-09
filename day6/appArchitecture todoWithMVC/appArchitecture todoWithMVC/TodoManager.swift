//
//  TodoManager.swift
//  appArchitecture todoWithMVC
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import Foundation

let AddCompletionNotification = Notification.Name("TodoAddCompleted")
let DeleteCompletionNotification = Notification.Name("TodoDeleteCompleted")

class TodoManager {
    static private var instance: TodoManager!
    static var shared: TodoManager {
        if nil == instance {
            instance = TodoManager()
        }
        return instance
    }
    
    private init() {
    }
    
    var todoList = [String]()
    
    var count: Int {
        return todoList.count
    }
    
    func remove(at index: Int){
        todoList.remove(at: index)
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: DeleteCompletionNotification, object: nil, userInfo: ["INDEX": index])
    }
    
    func todo(at index: Int) -> String? {
        if index < todoList.count {
            return todoList[index]
        }
        return nil
    }
    
    func add(todo: String) {
        todoList.append(todo)
        let index = todoList.count - 1
        
        NotificationCenter.default.post(name: AddCompletionNotification, object: nil, userInfo: ["INDEX": index])
    }
}
