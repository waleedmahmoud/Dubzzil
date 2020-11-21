//
//  ItemDetailsRouter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

final class ItemDetailsRouter {
    
    private func getItemDetailsStoryBoardViewController() -> ItemDetailsViewController {
        let className = String(describing: ItemDetailsViewController.self)
        return instantiate(className: className) as! ItemDetailsViewController
    }
    
}

extension ItemDetailsRouter: PresenterToRouterItemDetailsProtocol {

    func start() -> UIViewController {
        let viewController: ItemDetailsViewController = getItemDetailsStoryBoardViewController()
        let presenter: ViewToPresenterItemDetailsProtocol = ItemDetailsPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = self
        viewController.presenter?.view = viewController
        return viewController
    }
    
}

