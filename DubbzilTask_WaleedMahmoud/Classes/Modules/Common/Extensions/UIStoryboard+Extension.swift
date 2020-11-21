//
//  Extension+UIStoryboard.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

//MARK:- protocol for storyboard helpers
protocol Storyboarded {
    func instantiate(className: String) -> UIViewController
}

//MARK:- Storyboarded Default implementation for whos is class type

extension Storyboarded where Self: BaseRouter {
    func instantiate(className: String) -> UIViewController {
        let storyBoardName = className.replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: storyBoardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className)
    }
}

