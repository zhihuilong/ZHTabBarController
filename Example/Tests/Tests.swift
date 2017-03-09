import UIKit
import XCTest
import ZHTabBarController

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertNotNil(ZHTabBarController(), "ZHTabBarController is not nil")
        XCTAssertNotNil(ZHTabBarController(style: .Default), "ZHTabBarController is not nil")
        XCTAssertNotNil(ZHTabBarController(tabBarHeight: 44), "ZHTabBarController is not nil")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
