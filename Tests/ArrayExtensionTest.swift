//
//  ArrayExtensionTest.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 08/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest

class ArrayExtensionTest: XCTestCase {
    
    var arr = [String]()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAppendNvl() {
        let string1 = "string1"
        let string2: String? = nil
        
        arr.appendNvl(string1)
        XCTAssert(arr.count == 1)
        
        arr.appendNvl(string2)
        XCTAssert(arr.count == 1)
    }
    
    func testAppendNvlContents() {
        let strings1 = ["string1"],
            strings2: [String]? = nil
        
        arr.appendNvl(contentsOf: strings1)
        XCTAssert(arr.count == 1)
        
        arr.appendNvl(contentsOf: strings2)
        XCTAssert(arr.count == 1)
    }
    
    func testAppendFill() {
        let testFill = "testFill",
            firstString = "firstString"
        
        arr.append(fill: testFill, for: 5)
        XCTAssert(arr.count == 5)
        
        arr.append(fill: firstString, for: 1, prepend: true)
        XCTAssert(arr.count == 6)
        XCTAssert(arr.first! == firstString)
        
        arr.append(fill: testFill, for: 0, prepend: false)
        XCTAssert(arr.count == 6)
    }
    
    func testLastWithPredicate() {
        let string1 = "string1",
            string2 = "string2",
            string3 = "string3",
            string4 = "string4",
            string5 = "string5"
        
        arr = [string1, string3, string2, string3, string4]
        
        let lastString3 = arr.last { $0 == string3 }
        XCTAssert(lastString3 == string3)
        
        let lastString5 = arr.last { $0 == string5 }
        XCTAssertNil(lastString5)
        
        arr.removeAll()
        let lastString4 = arr.last { $0 == string4 }
        XCTAssertNil(lastString4)
    }
    
    func testAppendIfNotContain() {
        let string1 = "string1",
            string2 = "string2",
            string3 = "string3",
            string4 = "string4",
            string5 = "string5"
        
        arr = [string1, string3, string2, string3, string4]
        
        var isAdded = arr.appendIfNotContain(nil)
        XCTAssertFalse(isAdded)
        
        isAdded = arr.appendIfNotContain(string5)
        XCTAssertTrue(isAdded)
        
        isAdded = arr.appendIfNotContain(string5)
        XCTAssertFalse(isAdded)
    }
    
    func testToogleElement() {
        let string1 = "string1",
            string2 = "string2",
            string3 = "string3",
            string4 = "string4",
            string5 = "string5"
        
        arr = [string1, string2, string3, string4, string5]
        
        let stringNil: String? = nil
        arr.toogle(stringNil)
        XCTAssert(arr.count == 5)
        
        arr.toogle(string1)
        XCTAssert(arr.count == 4)
        
        arr.toogle(string1)
        XCTAssert(arr.count == 5)
    }
    
    func testToogleElements() {
        let string1 = "string1",
        string2 = "string2",
        string3 = "string3",
        string4 = "string4",
        string5 = "string5"
        
        arr = [string1, string2, string3, string4, string5]
        
        let stringsNil: [String]? = nil
        arr.toogle(stringsNil)
        XCTAssert(arr.count == 5)
        
        arr.toogle([string1])
        XCTAssert(arr.count == 4)
        
        arr.toogle([string1])
        XCTAssert(arr.count == 5)
    }
    
    func testRemoveNvl() {
        let string1 = "string1",
        string2 = "string2",
        string3 = "string3",
        string4 = "string4",
        string5 = "string5"
        
        arr = [string1, string2, string3, string4]
        
        let stringNil: String? = nil
        arr.removeNvl(stringNil)
        XCTAssert(arr.count == 4)
        
        arr.removeNvl(string5)
        XCTAssert(arr.count == 4)
        
        arr.removeNvl(string4)
        XCTAssert(arr.count == 3)
    }
    
    func testContainsNvl() {
        let string1 = "string1",
        string2 = "string2",
        string3 = "string3",
        string4 = "string4",
        string5 = "string5"
        
        arr = [string1, string2, string3, string4]
        
        let stringNil: String? = nil
        var isContained = arr.containsNvl(stringNil)
        XCTAssertFalse(isContained)
        
        isContained = arr.containsNvl(string5)
        XCTAssertFalse(isContained)
        
        isContained = arr.containsNvl(string4)
        XCTAssertTrue(isContained)
    }
}
