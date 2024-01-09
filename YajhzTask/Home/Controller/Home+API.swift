//
//  Home+API.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import UIKit

extension HomeViewController{
    func getClientProfile() {
        NetworkServices.shared.getClientProfile(vc: self) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.setUpClientData(data: data.data)
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
    
    func getPopular() {
        NetworkServices.shared.getPopular(vc: self) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.popularData = data
                    self?.homeTableView.reloadData()
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
    
    func getTrending() {
        NetworkServices.shared.getTrending(vc: self) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.trendingData = data
                    self?.homeTableView.reloadData()
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
    
    func getCategories() {
        NetworkServices.shared.getCategories(vc: self) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.categoriesData = data
                    self?.homeTableView.reloadData()
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
    
    func favorite(productId: String) {
        NetworkServices.shared.favorite(vc: self, productId: productId) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.getPopular()
                }else{
                    self?.makeAlert(title: data.message ?? "", SubTitle: "", Image: UIImage())
                }
            case .failure(let error):
                self?.makeAlert(title: error.localizedDescription, SubTitle: "", Image: UIImage())
            }
        }
    }
}
    
