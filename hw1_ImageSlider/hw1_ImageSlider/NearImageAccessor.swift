//
//  NearImageAccessor.swift
//  hw1_ImageSlider
//
//  Created by Yanghongsun on 2017. 1. 4..
//  Copyright © 2017년 YHS. All rights reserved.
//

import Foundation
import UIKit

class NearImageAccessor {
    init(withinFolder: String) {
        self.folderName = withinFolder
        
        let fileManger = FileManager.default
        let fullPath = Bundle.main.resourcePath! + "/" + folderName
        if let listOfItems = try? fileManger.contentsOfDirectory(atPath: fullPath) {
            self.listOfItems = listOfItems
            self.currentIndex = 0
            self.pointedImage = UIImage(named: folderName+"/"+listOfItems[0])
            
            if listOfItems.count >= 2 {
                isOnTheRight = true
            }
            
            print(listOfItems)
        }
    }
    var pointedImage: UIImage?
    var currentIndex: Int?
    var folderName: String
    var listOfItems: Array<String>?
    
    var isOnTheLeft: Bool = false
    var isOnTheRight: Bool = false
    
    func moveToLeft() -> Bool {
        guard self.currentIndex != nil, isOnTheLeft else {
            return false
        }
        
        self.currentIndex = self.currentIndex! - 1
        self.pointedImage = UIImage(named: self.folderName+"/"+self.listOfItems![self.currentIndex!])
        isOnTheRight = true
        // move act end
        
        if self.currentIndex!-1 < 0 {
            isOnTheLeft = false
        }
        
        return true
    }
    func moveToRight() -> Bool {
        guard self.currentIndex != nil, isOnTheRight else {
            return false
        }
        self.currentIndex = self.currentIndex! + 1
        self.pointedImage = UIImage(named: self.folderName+"/"+self.listOfItems![self.currentIndex!])
        isOnTheLeft = true
        // move act end
        
        if self.currentIndex!+1 >= listOfItems!.count {
            isOnTheRight = false
        }
        
        return true
    }
}
