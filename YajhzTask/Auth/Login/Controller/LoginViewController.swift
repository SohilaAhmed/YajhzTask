//
//  LoginViewController.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 08/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.addbottomCornerRadius(radius: 40)
        }
    }
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 

}
