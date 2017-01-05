//
//  ViewController.swift
//  listScene customCell
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, ProductCellDelegate, UITableViewDelegate {
    
    var productList : [Product]!
    
    func addCart(code: String) {
        print("add : ", code)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < productList.count{
            return .none
        }
        else{
            return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
        }else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "CUSTOM", for: indexPath) as! ProductCell
        cell.delegate = self
        
        let product = productList[indexPath.row]
        
        cell.productName.text = product.name
        //cell.productName.sizeToFit()
        cell.productPrice.text = product.price
        cell.productImage.image = UIImage(named: product.image)
        cell.productCode = product.code
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = [
            Product(code: "001", name: "Baseball", price: "100", image: "Baseball"),
            Product(code: "002", name: "Basketball", price: "200", image: "Basketball"),
            Product(code: "003", name: "Football", price: "300", image: "Football"),
            Product(code: "004", name: "Golf", price: "400", image: "Golf"),
            Product(code: "005", name: "Rugby", price: "500", image: "Rugby"),
            Product(code: "006", name: "Tennis", price: "600", image: "Tennis"),
            Product(code: "007", name: "Volleyball", price: "700", image: "Volleyball"),
            Product(code: "008", name: "TableTennis", price: "800", image: "TableTennis"),
            Product(code: "009", name: "IceHocky", price: "800", image: "IceHockey"),
            Product(code: "010", name: "Billiard", price: "800", image: "Billiard"),
        ]
    }
}

