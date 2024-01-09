//
//  PopularCollectionViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit
import Cosmos

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var textView: UIView!{
        didSet{
            addbottomCornerRadius(radius: 19)
        }
    }
    @IBOutlet weak var rateText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favPressed(_ sender: Any) {
        
    }
    
    
}
