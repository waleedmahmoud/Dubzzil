//
//  ItemDetailsPresenter.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

final class ItemDetailsPresenter {
    
    weak var view: PresenterToViewItemDetailsProtocol?
    var router: PresenterToRouterItemDetailsProtocol?
    var item: Result?
}

//MARK:- Input from view
extension ItemDetailsPresenter: ViewToPresenterItemDetailsProtocol {
    func viewDidLoad() {
        if let item = item {
            view?.shouldShowItemDetails(ItemDetails: item)
        }
    }
}

