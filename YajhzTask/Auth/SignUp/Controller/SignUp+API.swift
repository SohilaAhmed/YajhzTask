//
//  SignUp+API.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 10/01/2024.
//

import Foundation
import UIKit

extension SignUpViewController{
    func register(name: String, email: String, password: String, phone: String) {
        NetworkServices.shared.register(vc: self, name: name,
                                        email: email, password: password,
                                        phone: phone){ [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    UserDefaults.standard.set("\(data.data?.token ?? "")", forKey: "token")
                    let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
                    self?.view.window?.rootViewController = vc
                    
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
}
    
