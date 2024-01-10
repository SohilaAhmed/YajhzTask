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
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        phoneTF.delegate = self
    }
     
    @IBAction func signupPressed(_ sender: Any) {
        validation()
    }
    
    @IBAction func goToLoginPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
        view.window?.rootViewController = vc
    }
    
    func validation(){
        guard nameTf.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Name", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard emailTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Email", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard phoneTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Phone Number", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard phoneTF.text?.count == 11 else {
            makeAlert(title: "Phone Number must be 11 numbers", SubTitle: "", Image: UIImage())
            return
        }
        guard passTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Your Password", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard passTF.text?.count ?? 0 > 7 else {
            makeAlert(title: NSLocalizedString("Please Write 8 character at least", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard confirmPassTF.text != "" else {
            makeAlert(title: NSLocalizedString("Please Enter Confirm Password Field", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        guard confirmPassTF.text == passTF.text else {
            makeAlert(title: NSLocalizedString("Please Check Confirm Password", comment: ""), SubTitle: "", Image: UIImage())
            return
        }
        register(name: nameTf.text ?? "",
                 email: emailTF.text ?? "",
                 password: passTF.text ?? "",
                 phone: phoneTF.text ?? "")
    }
}

extension SignUpViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == phoneTF){
            guard let textFieldText = textField.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 11
        }
        return true
    }
}
