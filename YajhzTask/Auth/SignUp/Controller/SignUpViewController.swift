//
//  SignUpViewController.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 07/01/2024.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.addbottomCornerRadius(radius: 40)
        }
    }
    @IBOutlet weak var mainView: UIView!{
        didSet{
            mainView.addTopCornerRadius(radius: 40)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
     

}
