//
//  DubbzilTask_WaleedMahmoudUITests.swift
//  DubbzilTask_WaleedMahmoudUITests
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import XCTest

class DubbzilTask_WaleedMahmoudUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func testCellIndex0() throws {
        sleep(10)
        app.collectionViews.cells["cell0"].waitForExistence(timeout: 7.0)
        app.collectionViews.cells["cell0"].children(matching: .other).element.tap()
        app.navigationBars["Notebook"].buttons["Items Listing"].tap()
    }
    
    func testCellIndex1() throws {
        sleep(10)
        app.collectionViews.cells["cell1"].waitForExistence(timeout: 7.0)
        app.collectionViews.cells["cell1"].children(matching: .other).element.tap()
        app.navigationBars["Glasses"].buttons["Items Listing"].tap()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
