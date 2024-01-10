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
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
 
    @IBAction func loginPressed(_ sender: Any) {
        validation()
    }
    
    @IBAction func goTosignupPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "SignUp", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController")
        view.window?.rootViewController = vc
    }
    
    func validation(){
        guard emailTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Email", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
         
        guard passTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Password", comment: ""), SubTitle: "", Image: UIImage())
            return
        } 
        login(email: emailTF.text ?? "", password: passTF.text ?? "")
    }
}

 
