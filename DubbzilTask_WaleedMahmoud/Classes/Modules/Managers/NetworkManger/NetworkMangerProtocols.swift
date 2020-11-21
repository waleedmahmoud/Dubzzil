//
//  NetworkManger.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import Foundation
import Alamofire


public typealias SuccessBlock<T> = (_ response: T) -> Void
public typealias FailureBlock = (_ error: String?) -> Void

protocol BaseService {
    func fireApiCall()
}

protocol RequestFailureManagerProtocol {
    func handleFailure()
}

typealias NetworkRequest = BaseNetworkRequest

//MARK:- Defines the attributes of a `NetworkRequest` with each service class

protocol BaseNetworkRequest: BaseURLProperties {
    var endpoint: String { get }
    var method: Alamofire.HTTPMethod { get }
}

protocol BaseURLProperties {
    var baseUrl: String { get }
}

protocol NetworkProvider {
    func request <T: Codable> (_ request: NetworkRequest, mapToModel successModel: T.Type, successHandler: @escaping SuccessBlock<T>, failureHandler: @escaping FailureBlock)
}
