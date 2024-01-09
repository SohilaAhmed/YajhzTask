//
//  PopularTableViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var popularCollectionView: UICollectionView!{
        didSet{
            popularCollectionView.dataSource = self
            popularCollectionView.delegate = self
            popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell") 
        }
    }
    
    var popularArrData: [PopularDatum]?
    var favPressed: ((_ productId: String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 
    }

    func cellSetup(data: [PopularDatum]?){
        popularArrData = data
        popularCollectionView.reloadData()
    }
}
