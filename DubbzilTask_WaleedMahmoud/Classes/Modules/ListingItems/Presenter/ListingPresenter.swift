//
//  ListingPresenter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

final class ListingPresenter: ViewToPresenterListingProtocol {
    
    var listingResults: ListingResponse?
    
    weak var view: PresenterToViewListingProtocol?
    
    var interactor: PresenterToInteractorListingProtocol?
    
    var router: PresenterToRouterListingProtocol?

    
    //MARK:- Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadListingResults()
    }
    
    func shouldNavigateToItemDetails(with item: Result) {
        router?.shouldNavigateToItemDetails(with: item)
    }
    
}

//MARK:- Output to view
extension ListingPresenter: InteractorToPresenterListingProtocol {
    
    func fetchListingSuccess(listingResult: [Result]) {
        view?.onFetchListingSuccess(listingResult: listingResult)
        view?.hideHUD()
    }
    
    func getListingFailure(error: String) {
        view?.onFetchListingFailure(error: error)
    }
    
}

