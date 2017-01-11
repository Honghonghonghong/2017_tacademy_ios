//
//  ViewController.swift
//  network xml
//
//  Created by Tacademy-Mac on 2017. 1. 11..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

struct SongInfo {
    var title: String!
    var artist: String!
    var image: String!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let feedUrl = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/xml"
    var songList = [SongInfo]()
    var currentSong: SongInfo!
    var interestingTag = false
    var bufferStr = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongInfo_Cell",  for: indexPath)
        let song = songList[indexPath.row]
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        print("song: ",song.image)
        if let url = URL(string: song.image) {
            
            let request = URLRequest(url: url)
            if let cached = URLCache.shared.cachedResponse(for: request){
                print("cached hit:",indexPath.row)
                let image = UIImage(data: cached.data)
                cell.imageView?.image = image
            }
            else if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                cell.imageView?.image = image
                print("image download : \(indexPath.row)")
            }
            else {
                print("Invalid image : \(indexPath.row)")
            }
        }
        
        return cell
        
    }
    override func viewWillAppear(_ animated: Bool) {
        // 캐시 지우기
        URLCache.shared.removeAllCachedResponses()
        parseXML()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: XMLParserDelegate {
    func parseXML(){
        if let url = URL(string: feedUrl),
            let parser = XMLParser(contentsOf: url) {
            parser.delegate = self
            parser .parse()
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "entry" {
            currentSong = SongInfo()
        }
        else if elementName == "im:name" || elementName == "im:artist" {
            interestingTag = true
        }
        else if elementName == "im:image" && attributeDict["height"] == "55"{
            interestingTag = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "entry" {
            songList.append(currentSong)
            currentSong = nil
        }
        else if elementName == "im:name" {
            currentSong.title = bufferStr
            bufferStr = ""
        }
        else if elementName == "im:image" && interestingTag == true {
            currentSong.image = bufferStr

            bufferStr = ""
        }
        else if elementName == "im:artist" {
            currentSong.artist = bufferStr
            bufferStr = ""
        }
        
        if interestingTag {
            interestingTag = false
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if interestingTag {
            bufferStr += string
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("parsing 끝")
    }
}
