//
//  ProductImageCollectionViewCell.swift
//  CollectionViewOnTableViewAPI
//
//  Created by Smita Kankayya on 12/06/24.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        productImage.layer.borderWidth = 1
        productImage.layer.cornerRadius = 12
    }

}
