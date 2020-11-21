//
//  ListingRouter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

final class ListingRouter {
    
    private func getListingStoryBoardViewController() -> ListingViewController {
        let className = String(describing: ListingViewController.self)
        return instantiate(className: className) as! ListingViewController
    }
    
}

extension ListingRouter: PresenterToRouterListingProtocol {

    func start() -> UIViewController {
        let viewController: ListingViewController = getListingStoryBoardViewController()
        let presenter: ViewToPresenterListingProtocol & InteractorToPresenterListingProtocol = ListingPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = self
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ListingInteractor()
        viewController.presenter?.interactor?.listingService = ListingService()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.title = "Items Listing"
        return viewController
    }
    
    func shouldNavigateToItemDetails(with item: Result) {
         let detailsVc = ItemDetailsRouter().start() as? ItemDetailsViewController
        detailsVc?.presenter?.item = item
        AppDelegateRouter.shared.navigationController.pushViewController(detailsVc ?? UIViewController(), animated: true)
        
    }
}


