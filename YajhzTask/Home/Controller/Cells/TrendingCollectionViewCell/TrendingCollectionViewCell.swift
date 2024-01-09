//
//  TrendingCollectionViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImg: UIImageView!
     
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellSetup(data: TrendingDatum?){
        self.cellImg.sd_setImage(with: URL(string: (data?.image ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""), placeholderImage: UIImage(named: "logo"))
    }
}
