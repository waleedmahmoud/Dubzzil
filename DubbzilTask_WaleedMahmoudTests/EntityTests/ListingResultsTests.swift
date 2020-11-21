//
//  ListingResultsTests.swift
//  DubbzilTask_WaleedMahmoudTests
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import XCTest
@testable import DubbzilTask_WaleedMahmoud
class ListingResultsTests: XCTestCase {

    func testListingResultSetGet() {
        let results = [Result(createdAt: "12-11-2020", price: "999 AED", name: "NoteBook", uid: "786sa6dsd7s", imageIds: ["image id1"], imageUrls: ["imgUrl1"], imageThumbnails: ["Thumb1"])]
        let response = ListingResponse(results: results)
        XCTAssertEqual(response.results?.first?.name, "NoteBook")
        XCTAssertEqual(response.results?.first?.price, "999 AED")
        XCTAssertEqual(response.results?.first?.createdAt, "12-11-2020")
    }

}
