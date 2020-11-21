//
//  ListingCollectionViewCell.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 20/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit
import Kingfisher

class ListingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thmbImg: UIImageView!
    @IBOutlet weak var itemLabelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        thmbImg.image = nil
    }
    
    func bindData(with model: Result) {
        let url = URL(string: model.imageUrls?.first ?? "")
        thmbImg.kf.setImage(with: url, placeholder: UIImage(named: "placeHolder2"))
        itemLabelName.text = model.name
    }

}
