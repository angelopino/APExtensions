//
//  UIColorExtensionTest.swift
//  APJExtensionsiOSTests
//
//  Created by Angelo Pino on 02/08/2019.
//  Copyright © 2019 Pino, Angelo. All rights reserved.
//

import XCTest

class UIColorExtensionTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColorFromHexString() {
        let whiteCGCloroComponents: Array<CGFloat> = [1.0, 1.0, 1.0, 1.0],
            whiteColor = UIColor.colorFrom(hex: "#FFFFFF")
        XCTAssertEqual(whiteCGCloroComponents, whiteColor.cgColor.components)
        
        let whiteWithAlphaCGCloroComponents: Array<CGFloat> = [1.0, 1.0, 1.0, 0.5],
            whiteColorWithAlpha = UIColor.colorFrom(hex: "#FFFFFF", alpha: 0.5)
        XCTAssertEqual(whiteWithAlphaCGCloroComponents, whiteColorWithAlpha.cgColor.components)
        
        // test fail
        let failColor = UIColor.colorFrom(hex: "#F")
        XCTAssertEqual(failColor, UIColor.gray)
    }
    
    func testColorFromHexRgb() {
        let whiteCGCloroComponents: Array<CGFloat> = [1.0, 1.0, 1.0, 1.0],
        whiteColor = UIColor.colorFrom(rgb: 0xFFFFFF)
        XCTAssertEqual(whiteCGCloroComponents, whiteColor.cgColor.components)
        
        let whiteWithAlphaCGCloroComponents: Array<CGFloat> = [1.0, 1.0, 1.0, 0.5],
        whiteColorWithAlpha = UIColor.colorFrom(rgb: 0xFFFFFF, alpha: 0.5)
        XCTAssertEqual(whiteWithAlphaCGCloroComponents, whiteColorWithAlpha.cgColor.components)
    }
}
