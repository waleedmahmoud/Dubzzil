//
//  ListingViewController.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit
import Kingfisher

class ItemDetailsViewController: UIViewController {

    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemPriceLbl: UILabel!
    @IBOutlet var itemDateCreatedLbl: UILabel!
    //MARK:- Properties
    var presenter: ViewToPresenterItemDetailsProtocol?
//    var item: Result?
    
    //MARK:- ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func bindData(with item: Result) {
        if let imgUrl = URL(string: item.imageUrls?.first ?? "") {
            itemImage.kf.setImage(with: imgUrl, placeholder: UIImage(named: "placeHolder2"))
            itemName.text = item.name
            itemPriceLbl.text = item.price
            itemDateCreatedLbl.text = item.createdAt?.getDateFromTimeStamp()
        }
    }
    
}

//MARK:- View Output
extension ItemDetailsViewController: PresenterToViewItemDetailsProtocol {
    func shouldShowItemDetails(ItemDetails: Result) {
        bindData(with: ItemDetails)
        title = ItemDetails.name
    }
}
