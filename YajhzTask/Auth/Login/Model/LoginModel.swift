//
//  LoginModel.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 10/01/2024.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?
    var data: LoginDataClass?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - DataClass
struct LoginDataClass: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var type, status: Int?
    var balance: String?
    var addresses: [Address]?
    var token: String?
}

 
