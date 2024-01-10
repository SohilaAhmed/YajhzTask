//
//  Login+API.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 10/01/2024.
//

import Foundation
import UIKit

extension LoginViewController{
    func login(email: String, password: String) {
        NetworkServices.shared.login(vc: self, email: email, password: password) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    UserDefaults.standard.set("\(data.data?.token ?? "")", forKey: "token")
                    
                    let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
//                    self?.view.window?.rootViewController = vc
                    self?.navigationController?.pushViewController(vc, animated: true)
                    
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
    
