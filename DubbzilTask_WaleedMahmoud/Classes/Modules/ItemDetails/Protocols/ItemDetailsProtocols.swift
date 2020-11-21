//
//  ListingProtocols.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

// MARK:- View Input (View -> Presenter)

protocol ViewToPresenterItemDetailsProtocol: class {
    var view: PresenterToViewItemDetailsProtocol? { get set }
    var router: PresenterToRouterItemDetailsProtocol? { get set }
    var item: Result? { get set }
    func viewDidLoad()
}

// MARK:- View Output (Presenter -> View)

protocol PresenterToViewItemDetailsProtocol: class {
    func shouldShowItemDetails(ItemDetails: Result)
}

// MARK: Router Input (Presenter -> Router)

protocol PresenterToRouterItemDetailsProtocol: BaseRouter {}


