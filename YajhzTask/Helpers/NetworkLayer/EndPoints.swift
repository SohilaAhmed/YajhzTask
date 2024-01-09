//
//  EndPoints.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import Alamofire

class EndPoints {
    static let Instance = EndPoints()
    private init() {}
    
    func getHeader(withContent: Bool) -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: "token") ?? "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWI1MjczZjRkYzc4ZmE4MzM5MWYxMjkwNGUwNjY4Y2IwZGY1ZmRjYzhmNmU4ZmQ0N2Y0MTVjYWVhYTViZDMwZDcyZmFjZWJiMzVhMTQ0NzMiLCJpYXQiOjE3MDQ4MzU4MDkuNjM5Njc3LCJuYmYiOjE3MDQ4MzU4MDkuNjM5NjgyLCJleHAiOjE3MzY0NTgyMDkuNjM2ODM1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.pyyOvtqWyk0vWwxfxkBgEbL481Ns4E9oL1d_4wNW4i2awCicr0Frdaj95_Dyhsg95a1XAi_09Y4rSGLom5SflyXif14C5j9aDCbCR7uwtARj00hXU76Ipo1XW6wfTUvhX3tId8ZWk56q9e5N3DJm6XbMNizgR8jkoEw2h8dnuqWzs1vXHRsnSlrhVmFO258ye2cD2b9MzQLf5c-oD8BhyNIqlV9NkwgLkCWv1cUmjvgYkFcA44VHBcXMECABtem0lbagwNN0YQbsds7VsguV5f6DfCBJGYFhZTxc4h3GZaCsQ0x_eHuP_5W0uVs9xU4piv93MlckckSBW_QzvHM79G5yzixG0PancQOHIHqQfgVVgWe9N_08KqgY5TXh13ONwGoOUhfuMOYbfZCdqRRs_jaucmPsNQxGYgqfhM8z3xzkzHJM8ukhjhHae_J7KtG8HkZaCLufbVG-nZHhfznGb9Gw52NnTt5loR3qoRe2XX4aVYQ2P8vG2ODH30dBp0zC8uwjV8RFJWUtQDEZf9cFJ0E1Omhvm64YXEwpklG83rac8O66mBEARznTkBCIIcRbCWhNoI_iI9GwUpIbChleLvREhRkAv3ol5hf54QHzyDVI-NS4Q-sO6UqgH-XH8QYeHhPu8XVydFk5xbijAVhjNL7Qjj3XlEihuBNCBlx3aYc"
        var header: [HTTPHeader] = [
            .authorization(bearerToken: "\(token)")
        ]
        if withContent {
            header.append(HTTPHeader.contentType("application/json"))
            header.append(HTTPHeader.accept("application/json"))
        }
        header.append(HTTPHeader(name: "lang", value: "en"))
        return HTTPHeaders(header)
    }
      
    let baseUrl = "https://yogahez.mountasher.online/api"
    
    
    func getCategories() -> String {
        baseUrl + "/home-base-categories"
    }
    
    func getTrending() -> String {
        baseUrl + "/trending-sellers?lat=29.1931&lng=30.6421&filter=1"
    }
    
    func getPopular() -> String {
        baseUrl + "/popular-sellers?lat=29.1931&lng=30.6421&filter=1"
    }
    
    func login() -> String {
        baseUrl + "/login"
    }
    
    func register() -> String {
        baseUrl + "/client-register"
    }
    
    func getClientProfile() -> String {
        baseUrl + "/client-profile"
    }
    
    func favorite() -> String {
        baseUrl + "/favorite"
    }
}
