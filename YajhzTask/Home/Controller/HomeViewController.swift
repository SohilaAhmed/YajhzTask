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
    
    var cartBtn = UIButton()
    var groupBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
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
    
    func setupNavBar(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontColor]
            
            let backItemAppearance = UIBarButtonItemAppearance()
            backItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear] // fix text color
            appearance.backButtonAppearance = backItemAppearance
            
            let image = UIImage(named: "Vector")!.withRenderingMode(.alwaysOriginal)
            appearance.setBackIndicatorImage(image, transitionMaskImage: image)
            UINavigationBar.appearance().tintColor = UIColor.black
            
            if let font = UIFont(name: "TT Commons Medium", size: 24) {
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontColor,
                                                   NSAttributedString.Key.font: font]
            }
            
            navigationItem.titleView?.tintColor = UIColor.fontColor
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        self.navigationItem.title = NSLocalizedString("Home", comment: "")
        setupNavBtns()
        
    }
    
    func setupNavBtns(){
        cartBtn.setTitle("", for: .normal)
        cartBtn.setImage(UIImage(named: "Group"), for: .normal)
        groupBtn.setTitle("", for: .normal)
        groupBtn.setImage(UIImage(named: "Group 1"), for: .normal)
        let cartNavBtn = UIBarButtonItem(customView: cartBtn)
        let groupNavBtn = UIBarButtonItem(customView: groupBtn)
        navigationItem.rightBarButtonItems = [groupNavBtn, cartNavBtn]
    }
}
