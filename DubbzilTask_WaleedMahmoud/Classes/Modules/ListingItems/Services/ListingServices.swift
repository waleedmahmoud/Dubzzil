//
//  ListingServices.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import Foundation
import Alamofire
//MARK:- Delgates for API call
protocol APICallingDelegate: class {
    func fetchListingSuccess(listingResults: [Result])
    func fetchingListingFailure(with error: String)
}
//MARK:- specified for current request
struct ListingRequest: NetworkRequest {
    var endpoint: String
    var method: HTTPMethod
    var baseUrl: String
}

final class ListingService {
    
    var endPoint = "/default/dynamodb-writer"
    var baseUrl = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    
    weak var delegate: APICallingDelegate?
    
    private func buildRequest() -> ListingRequest{
        let request = ListingRequest(endpoint: endPoint, method: .get, baseUrl: baseUrl)
        return request
    }
    
}

extension ListingService: BaseService{
    
    func fireApiCall() {
        let request = buildRequest()
        NetworkManger.shared.request(request, mapToModel: ListingResponse.self) { [weak self](response) in
            self?.delegate?.fetchListingSuccess(listingResults: response.results ?? [])
        } failureHandler: { [weak self](error) in
            self?.delegate?.fetchingListingFailure(with: error?.description ?? "Error has been ocurred")
        }
    }
}
