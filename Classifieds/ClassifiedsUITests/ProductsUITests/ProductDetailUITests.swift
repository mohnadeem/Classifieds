//
//  ProductDetailUITests.swift
//  ClassifiedsUITests
//
//  Created by Muhammad Nadeem on 22/11/2020.
//

import XCTest

class ProductDetailUITests: XCTestCase {

    var app = XCUIApplication()
    
    // MARK: Testing Life Cycle
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /**
     Test product detail page
     */
    func testProductDetailPage() {
        
        // Step1: launch app
        app = XCUIApplication()
        
        // Step2: go to home screen
        waitForHomeView(app)
        sleep(10)
        gotoDetail(row: 0)
        sleep(8)
        app.buttons["Back"].tap()
        sleep(2)
        gotoDetail(row: 2)
        sleep(8)
        app.buttons["Back"].tap()
        if app.isDisplayingHome {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func gotoDetail(row: Int) {
        if app.isRunning {
            let homeTable = app.tables.matching(identifier: "productListTableView")
               let cell = homeTable.cells.element(matching: .cell, identifier: "productCell_\(row)")
               cell.tap()
        }
    }
}
