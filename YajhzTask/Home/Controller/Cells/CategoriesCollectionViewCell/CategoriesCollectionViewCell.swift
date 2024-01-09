//
//  CategoriesCollectionViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit
import SDWebImage

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
    }

    func cellSetUp(data: CategoriesDatum?){
        self.categoryImg.sd_setImage(with: URL(string: (data?.image ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""), placeholderImage: UIImage(named: "logo"))
        self.categoryName.text = data?.name ?? ""
    }
}
