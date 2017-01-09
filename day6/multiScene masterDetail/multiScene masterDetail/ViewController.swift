//
//  ViewController.swift
//  multiScene masterDetail
//
//  Created by Tacademy-Mac on 2017. 1. 9..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = ["apple.com", "swift.org", "google.com", "skplanet.com", "daum.net", "naver.com"]

    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "URL_CELL", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DETAIL_SEGUE" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            print("selected : ", data[indexPath.row])
            
            let detailVC = segue.destination as! DetailViewController
            detailVC.urlStr = data[indexPath.row]
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view, typically from a nib.
    }
}
