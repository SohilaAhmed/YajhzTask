//
//  HeaderTableViewCell.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var viewAllBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func viewAllPressed(_ sender: Any) {
    }
    
    func cellSetup(headerName: String){
        self.headerName.text = headerName
    }
}
