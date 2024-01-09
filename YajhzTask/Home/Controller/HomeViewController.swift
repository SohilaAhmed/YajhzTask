//
//  HomeViewController.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!{
        didSet{
            homeTableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell") 
        }
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    var popularData: PopularModel?
    var trendingData: TrendingModel?
    var categoriesData: CategoriesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getClientProfile()
        getPopular()
        getTrending()
        getCategories() 
    }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let headerView = homeTableView.tableHeaderView {
            
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                homeTableView.tableHeaderView = headerView
            }
        }
    }

}

extension HomeViewController{
    func setUpClientData(data: DataClass?){
        userName.text = "Hello " + "\(data?.name ?? "")"
        userAddress.text = data?.addresses?.first?.address ?? "Riyadh ( 15 -Jasmine neighbo..."
    }
}
