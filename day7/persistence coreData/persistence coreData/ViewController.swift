//
//  ViewController.swift
//  persistence coreData
//
//  Created by Tacademy-Mac on 2017. 1. 10..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    func addTodo(title: String, due date: Date)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: container.viewContext) as! Todo
        
        todo.title = title
        todo.dueDate = date as NSDate
        
        do {
            try container.viewContext.save()
            print("Save Success!")
        }
        catch let error {
            print("Err", error.localizedDescription)
        }
    }
    


    func resolveData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc: NSManagedObjectContext = container.viewContext
        
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            let result = try moc.fetch(request)
            for item in result{
                print(item.title)
            }
        }
        catch let error {
            print("Resolve Error :", error)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        
        addTodo(title: "1", due: Date())
        addTodo(title: "이거", due: Date())
        resolveData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
