//
//  APIRequest.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import NVActivityIndicatorView
import Alamofire


class NetworkRequest {
    class func postFormData<T: Codable>(vc: UIViewController, url: String, params: [String:Any], headers: HTTPHeaders?, completion: @escaping(Result<T, Error>) -> Void) {
        
        let frame = CGRect(x: vc.view.frame.width / 2 , y: vc.view.frame.height / 2, width: 0, height: 0)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                            type: .ballScale)
        activityIndicatorView.color = UIColor.darkGray
        activityIndicatorView.padding = 100
        vc.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        URLCache.shared.removeAllCachedResponses()
        AF.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in params {
                if let stringValue = value as? String {
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                } else if let intValue = value as? Int {
                    multipartFormData.append("\(intValue)".data(using: .utf8)!, withName: key)
                } else if let doubleValue = value as? Double {
                    multipartFormData.append("\(doubleValue)".data(using: .utf8)!, withName: key)
                } else if let boolValue = value as? Bool {
                    multipartFormData.append("\(boolValue)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: url, method: .post , headers: headers)
        .responseJSON(completionHandler: { response in
            DispatchQueue.main.async {
                activityIndicatorView.stopAnimating()
            }
            print(response.result)
            print(response.data)
            print(response)
            print(response.response)
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(json))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(jsonError))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        })
    }
    
    class func request<T: Codable>(vc: UIViewController, url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?, callBack:@escaping (Result<T, Error>) -> Void) {
        
        let frame = CGRect(x: vc.view.frame.width / 2 , y: vc.view.frame.height / 2, width: 0, height: 0)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                            type: .ballScale)
        activityIndicatorView.color = UIColor.darkGray
        activityIndicatorView.padding = 100
        vc.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        let jsonDecodeer = JSONDecoder()
        
        print(url)
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseDecodable(of: T.self) { (response) in
            DispatchQueue.main.async {
                activityIndicatorView.stopAnimating()
            }
            print(response.result)
            print(response.data)
            print(response)
            print(response.response)
            switch response.result {
            case .success:
                if let _ = response.data {
                    guard let resultData = response.data else { fatalError() }
                    do {
                        
                        let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                        print(basicResponse)
                        callBack(.success(basicResponse))
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                        callBack(.failure(error))
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                callBack(.failure(error))
            }
        }
    }
}


 
