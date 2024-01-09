//
//  CategoriesTableCell+CollectionDelegate.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import UIKit
 
extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesArrData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.cellSetUp(data: categoriesArrData?[indexPath.row])
        return cell
    }
     
}


extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140, height: (collectionView.frame.height) - 10)
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
    }
}
