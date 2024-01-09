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
}
