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
    
    func testBindFrameToSuperviewBounds() {
        var viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        viewForCheck.addSubview(viewBind)
        viewBind.bindFrameToSuperviewBounds()
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertEqual([viewForCheck.frame.height, viewForCheck.frame.width], [viewBind.frame.height, viewBind.frame.width])
        
        viewBind.removeFromSuperview()
        viewBind = UIView()
        let margin: CGFloat = 10,
            marginForCheck = margin * 2
        viewForCheck.addSubview(viewBind)
        viewBind.bindFrameToSuperviewBounds(marginLeft: margin, marginRight: margin, marginTop: margin, marginBottom: margin)
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertEqual([viewForCheck.frame.height - marginForCheck, viewForCheck.frame.width - marginForCheck], [viewBind.frame.height, viewBind.frame.width])
        
    }
    
}
