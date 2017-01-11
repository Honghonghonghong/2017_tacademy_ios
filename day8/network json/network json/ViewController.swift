//
//  ViewController.swift
//  network json
//
//  Created by Tacademy-Mac on 2017. 1. 11..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

struct SongInfo {
    var title: String?
    var image: String?
    var artist: String?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
    var songList = [SongInfo]()
    
    var imageCash = [URL: UIImage]()
    var operationQueue = OperationQueue()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songinfo_cell", for: indexPath)
        
        let song = songList[indexPath.row]
        cell.textLabel!.text = song.title
        cell.detailTextLabel!.text = song.artist
        
        if let urlStr = song.image, let url = URL(string: urlStr) ,let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            cell.imageView?.image = image
        }
        
        return cell
    }
    
    func parseJSON() {
        if let url = URL(string: urlStr),
            let data = try? Data(contentsOf: url) {
                do {
                    // JSON 파싱
                    if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                        let feed = result["feed"] as? [String:Any],
                        let entry = feed["entry"] as? [ [String:Any] ] { // Dictionary의 배열
                        for one in entry {
                            var song = SongInfo()
    
                            if let titleNode = one["title"] as? [String:AnyObject],
                                let title = titleNode["label"] as? String {
                                song.title = title
                            }
    
                            if let imageNode = one["im:image"] as? [ [String:AnyObject] ], // Dictionary의 배열
                                let image = imageNode[0]["label"] as? String {
                                song.image = image
                            }
                            
                            songList.append(song)
                        }
                        tableView.reloadData()
                    }
                }
                catch let error {
                    print("Error : ", error)
                }
                catch let error {
                    print(error)
                }
            }
            
        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        parseJSON()
    }
}
