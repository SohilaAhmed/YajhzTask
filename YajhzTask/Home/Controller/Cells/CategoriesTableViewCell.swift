//
//  CategoriesTableViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!{
        didSet{
            categoryCollectionView.dataSource = self
            categoryCollectionView.delegate = self
            categoryCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell") 
        }
    }
      
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
