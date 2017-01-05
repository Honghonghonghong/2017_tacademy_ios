//
//  ViewController.swift
//  listScene basicTable
//
//  Created by Tacademy-Mac on 2017. 1. 4..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var data : [String]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL-01", for: indexPath)
        
        let itemName = data[indexPath.row]
        cell.textLabel?.text = itemName
        let itemImage = UIImage(named: itemName)
        cell.imageView?.image = itemImage
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ["Baseball",
                "Basketball",
                "Football",
                "Golf",
                "Rugby",
                "Shuttlecock",
                "Tennis",
                "Volleyball",
                "pingpong",
                "IceHockey",
                "Billiard"]
        
    }
}

