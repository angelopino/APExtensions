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
        let view = UIView(),
        view1 = UIView(),
        view2 = UIView(),
        view3 = UIView()
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
        XCTAssert(view.subviews.count > 0)
        
        view.removeSubviews()
        
        XCTAssert(view.subviews.count == 0)
    }
    
    func testLoadViewFromNib() {
        let view = CustomViewTest()
        let viewFromNib = view.loadViewFromNib()
        
        XCTAssert(viewFromNib != nil)
    }
    
    func testLoadViewFromNibWithNibName() {
        let view = CustomViewTest()
        let viewFromNib = view.loadViewFromNib("CustomViewTest")
        
        XCTAssert(viewFromNib != nil)
    }
    
}
