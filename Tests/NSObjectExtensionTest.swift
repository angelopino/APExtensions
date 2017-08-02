//
//  NSObjectExtensionTest.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 01/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest


class NSObjectExtensionTest: XCTestCase {
    
    func testInstanceClassName() {
        let clazzName = FooViewController().className
        XCTAssert(clazzName == "FooViewController")
    }
    
    func testStaticClassName() {
        let clazzName = FooViewController.className
        XCTAssert(clazzName == "FooViewController")
    }
    
}

class FooViewController: UIViewController { }
