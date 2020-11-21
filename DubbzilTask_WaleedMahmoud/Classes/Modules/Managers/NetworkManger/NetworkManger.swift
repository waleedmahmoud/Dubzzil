//
//  NetworkManger.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManger: NetworkProvider {
    
    static let shared = {
        NetworkManger()
    }()
    
    func request<T>(_ request: NetworkRequest, mapToModel successModel: T.Type, successHandler: @escaping SuccessBlock<T>, failureHandler: @escaping FailureBlock) where T : Decodable, T : Encodable {
        
        networkRequest(request, mapToSuccessModel: successModel) { (response) in
            successHandler(response)
        } failureHandler: { (error) in
            failureHandler(error)
        }

    }
    
    private func networkRequest <T: Codable> (_ request: NetworkRequest,
                                              mapToSuccessModel successModel: T.Type,
                                              successHandler: @escaping SuccessBlock<T>,
                                              failureHandler: @escaping FailureBlock) {
        
        let request = AF.request(request.baseUrl + request.endpoint)
        // Receive and decode the server's JSON response.
        request.responseDecodable(of: successModel.self) { response in
            switch response.result {
            case let .success(result):
                successHandler(result)
            case let .failure(error):
                failureHandler(error.errorDescription)
                print("Error description is: \(error.localizedDescription)")
            }
            
        }
        
        
    }
}
