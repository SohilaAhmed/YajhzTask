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
    
    var favPressed: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favPressed(_ sender: Any) {
        favPressed?()
    }
    
    func cellSetup(data: PopularDatum?){
        self.productImg.sd_setImage(with: URL(string: (data?.image ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""), placeholderImage: UIImage(named: "logo"))
        self.productName.text = data?.name ?? ""
        self.cosmosView.rating = Double(data?.rate ?? "0.0") ?? 0.0
        self.rateText.text = data?.rate ?? "0"
        self.distanceText.text = "\(data?.distance ?? "")" + " km"
        setupFavImg(isFav: data?.isFavorite ?? false)
    }
    
    func setupFavImg(isFav: Bool){
        if isFav{
            favBtn.setImage(UIImage(named: "Vector 3"), for: .normal)
        }else{
            favBtn.setImage(UIImage(named: "Vector 4"), for: .normal)
        }
    }
    
}
