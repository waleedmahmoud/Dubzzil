//
//  IntegrationNetworkMangerTest.swift
//  DubbzilTask_WaleedMahmoudTests
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import XCTest
@testable import DubbzilTask_WaleedMahmoud

class IntegrationNetworkMangerTest: XCTestCase {
    
    let networkManger = NetworkManger.shared
    var listingResponse: ListingResponse?
    let badListingNetworkRequest = ListingRequest(endpoint: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com", method: .get, baseUrl: "/default/dynamodb-writer")
    let correctListingRequest = ListingRequest(endpoint: "/default/dynamodb-writer", method: .get, baseUrl: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com")
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        buildFirstListingResultMock()
    }
    
    private func buildFirstListingResultMock(){
        let result = Result(createdAt: "2019-02-24 04:04:17.566515", price: "AED 5", name: "Notebook", uid: "4878bf592579410fba52941d00b62f94", imageIds: ["9355183956e3445e89735d877b798689"], imageUrls: [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A46PMBWPUC&Signature=bxgUhWhp0aXzCVMmbKyj03LvJKc%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBIaCXVzLWVhc3QtMSJHMEUCIQCzaVVfNnRqOsYxADrfW472C3GbxTmfHjFoSN9aJ7DL%2BAIgWqaNhi0h871TCBjCwFMjadQtybcgvVzJkLtj0%2BKRcxoq1wEIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDCTQxmFC2MC4085lLSqrAY89i6I2HczzrJ23A9SKE%2FpqJPyvd%2Bbj52fmmXLB0yPkEPXJ9tdJEZZnD4I%2BYDXFNp293myba0oAIVwFPmF1sAIfgbVOioFhHKqHnHGCDlZdPgUx1xtF6TLcE%2Bk2CB2nVFCeWGNNh7b7AnWybwhyce7D8YVY7O2xdkFUxCh2NWh3LtgN7c2uSrSDySQNZnXXE%2FkREasLGo66DH6HSnKtDmwUr7aDnYaEqmrG5jCyvOP9BTrgAeyqo0KjYoXdmkLYzYXM7446KamKttkhYskkD2e7lIxUljdi%2BMtS%2BJd39I4EbFXAojaCow7CEtNaerwmmHGKAb8S9Hg%2FATByuGEygAmzv2x4wK9%2BOqC%2BH%2Fx%2BKfw%2FCpUvGQaGZ%2BieD8FVA9Nkx28PV%2BPEUc4P792%2BL13NSIOqcYxqx6qGH9dVrEM6XcK0GMV5%2BxpzdxEtLtoCCfZIbrNpxIQLkJqAxdDM%2F%2BMobGa4wnJES12oAhr5pTL7Fdr6MkQk%2F%2FD5MalqBo%2FNtpDRAwChZXTuHDTxhYtU9OqpVLd06d6N&Expires=1605954629"
        ], imageThumbnails: [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A46PMBWPUC&Signature=AT23lfJgcAQ7z54t4VVco5w2y2U%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBIaCXVzLWVhc3QtMSJHMEUCIQCzaVVfNnRqOsYxADrfW472C3GbxTmfHjFoSN9aJ7DL%2BAIgWqaNhi0h871TCBjCwFMjadQtybcgvVzJkLtj0%2BKRcxoq1wEIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDCTQxmFC2MC4085lLSqrAY89i6I2HczzrJ23A9SKE%2FpqJPyvd%2Bbj52fmmXLB0yPkEPXJ9tdJEZZnD4I%2BYDXFNp293myba0oAIVwFPmF1sAIfgbVOioFhHKqHnHGCDlZdPgUx1xtF6TLcE%2Bk2CB2nVFCeWGNNh7b7AnWybwhyce7D8YVY7O2xdkFUxCh2NWh3LtgN7c2uSrSDySQNZnXXE%2FkREasLGo66DH6HSnKtDmwUr7aDnYaEqmrG5jCyvOP9BTrgAeyqo0KjYoXdmkLYzYXM7446KamKttkhYskkD2e7lIxUljdi%2BMtS%2BJd39I4EbFXAojaCow7CEtNaerwmmHGKAb8S9Hg%2FATByuGEygAmzv2x4wK9%2BOqC%2BH%2Fx%2BKfw%2FCpUvGQaGZ%2BieD8FVA9Nkx28PV%2BPEUc4P792%2BL13NSIOqcYxqx6qGH9dVrEM6XcK0GMV5%2BxpzdxEtLtoCCfZIbrNpxIQLkJqAxdDM%2F%2BMobGa4wnJES12oAhr5pTL7Fdr6MkQk%2F%2FD5MalqBo%2FNtpDRAwChZXTuHDTxhYtU9OqpVLd06d6N&Expires=1605954629"
        ])
        listingResponse?.results?.append(result)
    }
    

    func test_ListingRequest_ReturnErrorListingResponse() throws {
        networkManger.request(badListingNetworkRequest, mapToModel: ListingResponse.self) { (response) in
            if (response.results?.first == self.listingResponse?.results?.first) {
                XCTAssertEqual(response.results?.first, self.listingResponse?.results?.first)
            }
        } failureHandler: { (error) in
            XCTAssert(((error?.description) != nil))
        }

    }
    
    func test_ListingRequest_ReturnCorrectListingResponse() throws {
        networkManger.request(correctListingRequest, mapToModel: ListingResponse.self) { (response) in
            if (response.results?.first == self.listingResponse?.results?.first) {
                XCTAssertEqual(response.results?.first, self.listingResponse?.results?.first)
            }
        } failureHandler: { (error) in
            XCTAssert(((error?.description) != nil))
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
