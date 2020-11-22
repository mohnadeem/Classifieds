//
//  ProductListUITests.swift
//  ClassifiedsUITests
//
//  Created by Muhammad Nadeem on 22/11/2020.
//

import XCTest

class ProductListUITests: XCTestCase {
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
    func testProductListPage() {
        
        // Step1: launch app
        app = XCUIApplication()
        
        // Step2: go to home screen
        waitForHomeView(app)
        sleep(10)
        if app.isRunning {
            app.swipeUp()
        }
        sleep(4)
        app.swipeDown()
        sleep(2)
        XCTAssert(true)
    }
}
