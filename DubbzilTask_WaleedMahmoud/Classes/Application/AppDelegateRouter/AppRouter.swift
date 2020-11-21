//
//  AppRouter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit



class AppDelegateRouter {
    
    var navigationController: UINavigationController
    static let shared = AppDelegateRouter(with: UINavigationController())
    
    private init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}
extension AppDelegateRouter: AppDelegateBaseRouter {

    func start() -> UIViewController {
        let listingViewController = ListingRouter().start()
        push(viewController: listingViewController, to: navigationController)
        return navigationController
    }
}

extension AppDelegateRouter: PushingViewControllers {
    func push(viewController: UIViewController, to navigtionController: UINavigationController) {
        
        navigtionController.pushViewController(viewController, animated: false)
    }
    
        
    
}
