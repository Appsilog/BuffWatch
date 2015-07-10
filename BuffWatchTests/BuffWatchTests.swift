//
//  BuffWatchTests.swift
//  BuffWatchTests
//
//  Created by jay on 7/1/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import XCTest
import Foundation
@testable import BuffWatch

class BuffWatchTests: XCTestCase {
    let buffer = BufferAPI()
    
    func testFakeData(){
        let posts = FakeData.getPending()
       print(posts)
        XCTAssertTrue(posts.count > 0)
        
    }
    
    func testGetPending(){
        
        
        let bundle = NSBundle(forClass: self.classForCoder)
        let path = bundle.pathForResource("pending", ofType: "json")
        let url: NSURL = NSURL(fileURLWithPath: path!)
        let jsonData: NSData = NSData(contentsOfURL: url)!
        
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let updates = json["updates"] as? [NSDictionary]
            XCTAssertTrue(buffer.populatePosts(updates).count > 0)
        }catch{
            
        }
        
    }
    
  
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
