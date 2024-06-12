//
//  CartsTableViewCell.swift
//  CollectionViewOnTableViewAPI
//
//  Created by Smita Kankayya on 12/06/24.
//

import UIKit
import Kingfisher

class CartsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartNoLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var mainContainerView: UIView!
    
    var cartData: Cart?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainContainerView.layer.cornerRadius = 12
        mainContainerView.layer.masksToBounds = true
        
        initializeCollectionView()
        registerXIBWithCollectionView()
    }
    
    func  initializeCollectionView(){
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    func registerXIBWithCollectionView(){
        let uiNib = UINib(nibName: "ProductImageCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uiNib, forCellWithReuseIdentifier: "ProductImageCollectionViewCell")
    }
    
    func initCart(dataValues: Cart?){
        cartData = dataValues
        productCollectionView.reloadData()
    }
}

//MARK : UICollectionViewDataSource
extension  CartsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartData?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cartsTableViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCollectionViewCell", for: indexPath) as! ProductImageCollectionViewCell
        if let urlString = cartData?.products[indexPath.row].thumbnail {
            cartsTableViewCell.productImage.kf.setImage(with: URL(string: urlString))
        }
        return cartsTableViewCell
    }
}

//MARK : UICollectionViewDelegateFlowLayout
extension  CartsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

