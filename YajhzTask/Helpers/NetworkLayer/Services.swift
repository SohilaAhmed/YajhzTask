//
//  Services.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import Alamofire
import UIKit

class NetworkServices {
    static let shared = NetworkServices()
    private init() {}
    
    func getPopular(vc: UIViewController, callBack: @escaping (Result<PopularModel, Error>) -> Void) {
        NetworkRequest.request(vc: vc,
                               url: EndPoints.Instance.getPopular(),
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default,
                               headers: EndPoints.Instance.getHeader(withContent: true), callBack: callBack)
    }
    
    func getTrending(vc: UIViewController, callBack: @escaping (Result<TrendingModel, Error>) -> Void) {
        NetworkRequest.request(vc: vc,
                               url: EndPoints.Instance.getTrending(),
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default,
                               headers: EndPoints.Instance.getHeader(withContent: true), callBack: callBack)
    }
    
    func getCategories(vc: UIViewController, callBack: @escaping (Result<CategoriesModel, Error>) -> Void) {
        NetworkRequest.request(vc: vc,
                               url: EndPoints.Instance.getCategories(),
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default,
                               headers: EndPoints.Instance.getHeader(withContent: true), callBack: callBack)
    }
    
    func getClientProfile(vc: UIViewController, callBack: @escaping (Result<ClientProfileModel, Error>) -> Void) {
        NetworkRequest.request(vc: vc,
                               url: EndPoints.Instance.getClientProfile(),
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default,
                               headers: EndPoints.Instance.getHeader(withContent: true), callBack: callBack)
    }
    
    func favorite(vc: UIViewController, productId: String, callBack: @escaping (Result<FavModel, Error>) -> Void) {
        let parameters = ["user_id": productId
        ]
 
        print(parameters)
        NetworkRequest.postFormData(vc: vc,
                                    url: EndPoints.Instance.favorite(),
                                    params: parameters,
                                    headers: EndPoints.Instance.getHeader(withContent: true),
                                    completion: callBack)
    }
    
    func login(vc: UIViewController, email: String, password: String, callBack: @escaping (Result<LoginModel, Error>) -> Void) {
        let parameters = ["email": email,
                          "password": password,
                          "device_token": "12233454566787877"
        ]
 
        print(parameters)
        NetworkRequest.postFormData(vc: vc,
                                    url: EndPoints.Instance.login(),
                                    params: parameters,
                                    headers: nil,
                                    completion: callBack)
    }
    
    func register(vc: UIViewController, name: String,
                  email: String, password: String,
                  phone: String, callBack: @escaping (Result<LoginModel, Error>) -> Void) {
        let parameters = ["name": name,
                          "email": email,
                          "password": password,
                          "phone": phone,
                          "device_token": "12233454566787877"
        ]
 
        print(parameters)
        NetworkRequest.postFormData(vc: vc,
                                    url: EndPoints.Instance.register(),
                                    params: parameters,
                                    headers: nil,
                                    completion: callBack)
    }
}
