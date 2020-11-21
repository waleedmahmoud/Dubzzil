//
//  InteractorToPresenterListingTests.swift
//  DubbzilTask_WaleedMahmoudTests
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import XCTest
@testable import DubbzilTask_WaleedMahmoud

class StringUtilityTests: XCTestCase {
    var expectedDate = "Feb 24,2019"
    var unExpected = "Mar 24,2020"
    var timeStamp = "2019-02-24 04:04:17.566515"
    
    override func setUp() {
        super.setUp()
    }
    
    func test_TimeStamp_ReturnsCorrectDateFormate() {
        let formattedDate = timeStamp.getDateFromTimeStamp()
        XCTAssertEqual(formattedDate, expectedDate)
    }
    
    func test_TimeStamp_ReturnWrongDateFormate() {
        let formattedDate = timeStamp.getDateFromTimeStamp()
        XCTAssertNotEqual(formattedDate, unExpected)
    }
}

