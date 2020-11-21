//
//  ListingProtocols.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

// MARK:- View Input (View -> Presenter)

protocol ViewToPresenterListingProtocol: class {
    var view: PresenterToViewListingProtocol? { get set }
    var interactor: PresenterToInteractorListingProtocol? { get set }
    var router: PresenterToRouterListingProtocol? { get set }
    var listingResults: ListingResponse? { get }
    func viewDidLoad()
    func shouldNavigateToItemDetails(with item: Result)
}

// MARK:- View Output (Presenter -> View)

protocol PresenterToViewListingProtocol: class {
    func onFetchListingSuccess(listingResult: [Result])
    func onFetchListingFailure(error: String)
    func showHUD()
    func hideHUD()
}

// MARK:- Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorListingProtocol: class {
    var presenter: InteractorToPresenterListingProtocol? { get set }
    var listingService: ListingService? { get set }
    func loadListingResults()
}

// MARK:- Interactor Output (Interactor -> Presenter)

protocol InteractorToPresenterListingProtocol: class {
    func fetchListingSuccess(listingResult: [Result])
    func getListingFailure(error: String)
}

// MARK: Router Input (Presenter -> Router)

protocol PresenterToRouterListingProtocol: BaseRouter {
    func shouldNavigateToItemDetails(with item: Result)
}

