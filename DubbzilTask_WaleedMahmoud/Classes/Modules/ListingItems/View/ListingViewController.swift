//
//  ListingViewController.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit
import PKHUD

class ListingViewController: UIViewController {

    @IBOutlet weak var listingCollectionView: UICollectionView!
    //MARK:- Properties
    var presenter: ViewToPresenterListingProtocol?
    var collectionDataSource: ListingCollectionViewDataSource?
    //MARK:- ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionDataSource()
        registerCollectionCell()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:- View Output
extension ListingViewController: PresenterToViewListingProtocol {
    
    func onFetchListingSuccess(listingResult: [Result]) {
        collectionDataSource?.resultsDataSource = listingResult
        listingCollectionView.reloadData()
    }
    
    func onFetchListingFailure(error: String) {
        print("\(error)")
    }
    
    func showHUD() {
        HUD.show(.progress)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
}

extension ListingViewController {
    //MARK:- setup CollectionView DataSource
    private func setupCollectionDataSource() {
        guard let presenter = self.presenter else { return }
        collectionDataSource = ListingCollectionViewDataSource(with: presenter)
        collectionDataSource?.delegate = self
        listingCollectionView.delegate = collectionDataSource
        listingCollectionView.dataSource = collectionDataSource
    }
    
    private func registerCollectionCell() {
        listingCollectionView.register(cellType: ListingCollectionViewCell.self)
    }
}

//MARK:- receiving selection from data source

extension ListingViewController: DataSourceToViewDelegate {
    func didSelect(with item: Result) {
        presenter?.shouldNavigateToItemDetails(with: item)
    }
}
