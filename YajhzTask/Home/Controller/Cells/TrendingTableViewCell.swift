//
//  TrendingTableViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet weak var trendingCollectionView: UICollectionView!{
        didSet{
            trendingCollectionView.dataSource = self
            trendingCollectionView.delegate = self
            trendingCollectionView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingCollectionViewCell") 
        }
    }
    
    var trendingArrData: [TrendingDatum]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 
    }
    
    func cellSetup(data: [TrendingDatum]?){
        trendingArrData = data
        trendingCollectionView.reloadData()
    }

}
