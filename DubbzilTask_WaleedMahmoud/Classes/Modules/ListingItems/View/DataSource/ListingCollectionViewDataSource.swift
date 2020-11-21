//
//  ListingTableDataSource.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

protocol DataSourceToViewDelegate {
    func didSelect(with item: Result)
}

class ListingCollectionViewDataSource: NSObject {
    var resultsDataSource: [Result]?
    var presenter: ViewToPresenterListingProtocol?
    var delegate: DataSourceToViewDelegate?
    
    init(with presenter: ViewToPresenterListingProtocol) {
        super.init()
        self.presenter = presenter
    }

}

extension ListingCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultsDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ListingCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let model = resultsDataSource?[indexPath.row] else { return cell }
        cell.bindData(with: model)
        cell.accessibilityIdentifier = "cell\(indexPath.row)"
        return cell
    }
    
    
}

extension ListingCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = resultsDataSource?[indexPath.row] else { return }
        delegate?.didSelect(with: item)
    }
}

extension ListingCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    //MARK:- Delegates Flowlayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 28) / 2
        let height = (collectionView.frame.height - 24) / 3
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
