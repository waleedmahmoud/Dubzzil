//
//  BaseRouter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

/*
 Rules:
    - BaseCoordinator should be inherited for all ViewController's coordinator.
*/

protocol PushingViewControllers {
    func push(viewController: UIViewController, to navigtionController: UINavigationController)
}

protocol AppDelegateBaseRouter: PushingViewControllers {
    func start() -> UIViewController
}

protocol BaseRouter: class, Storyboarded {
    func start() -> UIViewController
}

