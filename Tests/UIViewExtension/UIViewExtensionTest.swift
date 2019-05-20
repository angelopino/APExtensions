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
        
        XCTAssertNotNil(viewFromNib)
    }
    
    func testLoadViewFromNibWithNibName() {
        let view = CustomViewTest()
        let viewFromNib = view.loadViewFromNib("CustomViewTest")
        
        XCTAssertNotNil(viewFromNib)
    }
    
    func testBindFrameToSuperviewBounds() {
        let viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        viewForCheck.addSubview(viewBind)
        viewBind.bindFrameToSuperviewBounds()
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertEqual([viewForCheck.frame.height, viewForCheck.frame.width], [viewBind.frame.height, viewBind.frame.width])
    }
    
    func testBindFrameToSuperviewBoundsWithMargin() {
        var viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
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
    
    func testBindFrameToSuperviewBoundsMarginLeftFail() {
        let viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let margin: CGFloat = 10
        
        viewForCheck.addSubview(viewBind)
        viewBind.bindFrameToSuperviewBounds(marginLeft: margin)
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertNotEqual([viewForCheck.frame.height, viewForCheck.frame.width], [viewBind.frame.height, viewBind.frame.width])
    }
    
    func testBindFrameToSuperviewBoundsMarginRight() {
        let viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let margin: CGFloat = 10
        
        viewForCheck.addSubview(viewBind)
        viewBind.bindFrameToSuperviewBounds(marginRight: margin)
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertEqual([viewForCheck.frame.height, viewForCheck.frame.width - margin], [viewBind.frame.height, viewBind.frame.width])
    }
    
    func testBindFrameToSuperviewSuperviewFail() {
        let viewBind = UIView()
        let viewForCheck = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        viewBind.bindFrameToSuperviewBounds()
        viewBind.setNeedsLayout()
        viewBind.layoutIfNeeded()
        
        XCTAssertNotEqual([viewForCheck.frame.height, viewForCheck.frame.width], [viewBind.frame.height, viewBind.frame.width])
    }

    
    func testSnapshot() {
        let view = CustomViewTest()
        let viewFromNib = view.loadViewFromNib()
        
        XCTAssertNotNil(viewFromNib?.snapshot())
    }
    
    func testSnapshotNil() {
        let view = CustomViewTest()
        
        XCTAssertNil(view.snapshot())
    }
    
}
