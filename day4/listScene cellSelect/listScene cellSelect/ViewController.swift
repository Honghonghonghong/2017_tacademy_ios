//
//  ViewController.swift
//  listScene cellSelect
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeBtn: UIButton!
    
    var style = UITableViewCellEditingStyle.insert
    
    @IBAction func changeBtnAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "추가" {
            sender.setTitle("삭제", for: .normal)
            style = .delete
        } else {
            sender.setTitle("추가", for: .normal)
            style = .insert
        }
        tableView.reloadData()
    }
    
    var data = ["1","2","3","4","5","6","7","8","9","10"]

    // toggle editing mode
    @IBAction func changeEditMode(_ sender: UIButton) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    // editing mode
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return style
    }
    
    @IBAction func checkBtn(_ sender: UIButton) {
        if let indexPathList = tableView.indexPathsForSelectedRows {
            print(indexPathList)
            for indexPath in indexPathList {
                print(indexPath.row)
            }
        }
    }
    
    // move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        data.insert(data.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else {
            var inputText: String?
            
            let dialog = UIAlertController(title: "추가하기", message: "입력하세요", preferredStyle: UIAlertControllerStyle.alert)
            dialog.addTextField(configurationHandler: { (textField: UITextField) in
                textField.keyboardType = .default
            })
            dialog.addAction(UIAlertAction(title: "입력", style: .default, handler: { (action) in
                inputText = dialog.textFields![0].text
                
                if let input = inputText {
                    self.data.insert(input, at: indexPath.row+1)
                    var nextIndexPath = indexPath
                    nextIndexPath.row += 1
                    
                    tableView.insertRows(at: [nextIndexPath], with: .automatic)
                    
                }
            }))
            dialog.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            self.present(dialog, animated: true, completion: nil)
            
            
//            self.show(dialog, sender: nil)
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect \(data[indexPath.row])")
        
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("accessory \(data[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL-01", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell  
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for:indexPath)
//        let itemName = data[indexPath.row]
//        cell.textLabel?.text = itemName
//        let image = UIImage(named: "\(itemName).png")
//        cell.imageView?.image = image
//        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

