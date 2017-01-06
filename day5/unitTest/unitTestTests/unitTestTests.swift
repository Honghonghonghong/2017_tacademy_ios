//
//  unitTestTests.swift
//  unitTestTests
//
//  Created by Tacademy-Mac on 2017. 1. 6..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import XCTest
@testable import unitTest

class unitTestTests: XCTestCase {
    var target: ViewController!
    
    override func setUp() {
        super.setUp()
        
        target = ViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let ret = target.add(1, 2)
        XCTAssertEqual(ret, (1+2))
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
            _ = self.target.add(1, 2)
            for i in 0...1000{
                print(i)
            }

            // Put the code you want to measure the time of here.
        }
    }
    
}
