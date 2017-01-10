//
//  ViewController.swift
//  persistence realm
//
//  Created by Tacademy-Mac on 2017. 1. 10..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import RealmSwift

class Todo: Object {
    dynamic var title: String!
    dynamic var dueDate: Date!
}

class ViewController: UIViewController {
    
    func add(title: String, due date: Date){
        let todo = Todo()
        todo.title = title
        todo.dueDate = date
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo)
                print("Add success")
            }
            
        } catch let error {
            print(error)
        }
    }
    
    func resolveAll() {
        let realm = try! Realm()
        let todos = realm.objects(Todo.self).sorted(byProperty: "dueDate", ascending: false)
        
        print("count : ", todos.count)
        
        for todo in todos {
            print(todo.title, todo.dueDate)
        }
    }
    func findTodo(title: String) -> [Todo] {
        let realm = try! Realm()
        let result: Results<Todo> = realm.objects(Todo.self).filter("title = %@", title)
        
        return Array<Todo>(result)
    }
    
    func changeTodo(from: String, to: String) {
        let todos = findTodo(title: from)
        
        guard todos.count > 0 else {
            print("바꾸려는 데이터 없음")
            return
        }
        let realm = try! Realm()
        
        do {
            try realm.write {
                for todo in todos{
                    todo.title = to
                }
            }
        }
        catch let error {
            print(error)
        }
    }
    func deleteTodo(title: String){
        let todo = findTodo(title: title)
        
        let realm = try! Realm()
        guard todo.count > 0 else {
            print("삭제하려는 데이터 없음")
            return
        }
//        try! realm.write {
//            realm.delete(todo)
//        }
        
        do{
            try realm.write {
                realm.delete(todo)
            }
        }
        catch let error {
            print(error)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSHomeDirectory())
        
        add(title: "Realm 4", due: Date())
        
        let r = findTodo(title: "Realm 3")
        for rr in r {
            print(rr.dueDate)
        }
        
        changeTodo(from: "Realm 1", to: "Realm 99")
        
        delete("Realm 0")
        resolveAll()
    }
    

}
