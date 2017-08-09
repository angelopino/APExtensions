//
//  UIViewExtensionTest.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 01/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest

class UIViewExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveSubviews() {
        let mainView = UIView(),
            subviews = [UIView(), UIView(), UIView(), UIView()]
        
        for view in subviews {
            mainView.addSubview(view)
        }
        
        XCTAssert(mainView.subviews.count == subviews.count)
        
        mainView.removeSubviews()
        
        XCTAssert(mainView.subviews.count == 0)
    }
    
}
