//
//  Extension+UICollectionViewCell.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
    static var className: String { get }
}

extension ReusableView {
    //Mark:- For reuseIdentifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    //Mark:- For getting className
    static var className: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
//        cell.accessibilityIdentifier = type(of: cell).className + "_\(indexPath.section)_\(indexPath.row)"
        return cell
    }
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
}

extension UICollectionViewCell: ReusableView {}
