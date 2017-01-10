//
//  ViewController.swift
//  persistence bundleData
//
//  Created by Tacademy-Mac on 2017. 1. 10..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundlePath = Bundle.main.bundlePath
        print("bundle path : ", bundlePath)
        
        let homePath = NSHomeDirectory()
        print("home path : ", homePath)
        
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        print("document path : ", documentPath)
        
        // 홈 경로에서 도큐먼트 폴더 경로 알기
        
        let documentPath2 = NSHomeDirectory() + "/Documents"
        print("document path2", documentPath2)
        
        let tempPath = NSTemporaryDirectory()
        print("temp path : ", tempPath)
        
        // 번들 내 리소스 경로
        let path = Bundle.main.path(forResource: "idols", ofType: "plist")!

        print("resource path : ", path)

        
        saveStrData()
        saveArrayData()
    }
    func saveStrData() {
        let str = "Hello World"
        let filePath = NSHomeDirectory() + "/Documents/hello.txt"
        
        do {
            try str.write(toFile: filePath, atomically: true, encoding: .utf8)
        }
        catch {
            print("파일 저장 에러")
        }
        
        let str2 = try! String(contentsOfFile: filePath)
        print(str2)
    }
    func saveArrayData() {
        // 파일 경로
        let filePath = NSHomeDirectory() + "/Documents/holiday.plist"
        
        // 배열
        let holiday = ["신정", "구정", "삼일절", "노동절", "어린이날"]
        // NSArray로 타입 캐스팅 후 저장
        (holiday as NSArray).write(toFile: filePath, atomically: true)
        
        let arrayFromFile = NSArray(contentsOfFile: filePath)
        // Swift Array로 타입 캐스팅
        let holiday2 = arrayFromFile as! [String]
        
        print("== Array From File")
        print(holiday2)
    }

}

