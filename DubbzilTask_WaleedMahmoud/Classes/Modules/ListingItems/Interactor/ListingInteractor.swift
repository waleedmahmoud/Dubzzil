//
//  ListingInteractor.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

final class ListingInteractor: PresenterToInteractorListingProtocol {
    
    // MARK:- Properties
    weak var presenter: InteractorToPresenterListingProtocol?
    var listingService: ListingService?
    func loadListingResults() {
        executeAPICall()
    }
    
    
}

extension ListingInteractor {
    func executeAPICall(){
        listingService?.fireApiCall()
        listingService?.delegate = self
    }
}

extension ListingInteractor: APICallingDelegate {
    func fetchListingSuccess(listingResults: [Result]) {
        self.presenter?.fetchListingSuccess(listingResult: listingResults)
    }
    
    func fetchingListingFailure(with error: String) {
        self.presenter?.getListingFailure(error: error)
    }
    
    
}

