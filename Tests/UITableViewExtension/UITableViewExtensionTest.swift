//
//  UITableViewExtensionTest.swift
//  APJExtensionsiOSTests
//
//  Created by Pino, Angelo on 07/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import XCTest

class UITableViewExtensionTest: XCTestCase {
    
    var bundle: Bundle!
    
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: type(of: self))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegisterCellName() {
        let tableView = UITableView()
        tableView.register(cellName: OneTableViewCell.className, bundle: bundle)
        tableView.register(cellName: TwoTableViewCell.className)
        test(tableView: tableView)
        tableView.register(cellName: "fakecell")
    }
    
    func testRegisterCellNames() {
        
        let tableView = UITableView()
        tableView.register(cellNames: [OneTableViewCell.className, TwoTableViewCell.className], bundle: bundle)
        test(tableView: tableView)
    }
    
    private func test(tableView: UITableView) {
        
        let nibsRegistered = tableView.value(forKey: "_nibMap") as? [String: Any]
        XCTAssertNotNil(nibsRegistered?[OneTableViewCell.className])
        XCTAssertNotNil(nibsRegistered?[TwoTableViewCell.className])
    }
    
}
