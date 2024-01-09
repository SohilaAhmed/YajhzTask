//
//  HomeModel.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation

// MARK: - ClientProfileModel
struct ClientProfileModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?
    var data: DataClass?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var type, status: Int?
    var balance: String?
    var addresses: [Address]?
    var token: String?
}

// MARK: - Address
struct Address: Codable {
    var id: Int?
    var lat, lng: String?
    var address: String?
    var street, building, apartment: String?
    var floor, name: String?
} 


// MARK: - PopularModel
struct PopularModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?
    var data: [PopularDatum]?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - Datum
struct PopularDatum: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var logo: String?
    var description: String?
    var distance: String?
    var type, status: Int?
    var lat, lng, address, appointments: String?
    var trending, popular: Int?
    var rate: String?
    var isFavorite: Bool?
    var categories: [Category]?
    var token: String?
    var information: Information?
    var productCategories: [ProductCategory]?

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, image, logo, description, distance, type, status, lat, lng, address, appointments, trending, popular, rate
        case isFavorite = "is_favorite"
        case categories, token, information
        case productCategories = "product_categories"
    }
}

// MARK: - Category
struct Category: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var active: Int?
}

// MARK: - Information
struct Information: Codable {
    var id: Int?
    var identityNumber, taxRecord: String?
    var nationality: String?
    var vehicleImage, vehicleTabletImage, vehicleRegistration, drivingImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case identityNumber = "identity_number"
        case taxRecord = "tax_record"
        case nationality
        case vehicleImage = "vehicle_image"
        case vehicleTabletImage = "vehicle_tablet_image"
        case vehicleRegistration = "vehicle_registration"
        case drivingImage = "driving_image"
    }
}

// MARK: - ProductCategory
struct ProductCategory: Codable {
    var id: Int?
    var name: String?
    var active: Int?
    var nameAr, nameEn: String?

    enum CodingKeys: String, CodingKey {
        case id, name, active
        case nameAr = "name_ar"
        case nameEn = "name_en"
    }
}


// MARK: - TrendingModel
struct TrendingModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?
    var data: [TrendingDatum]?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - Datum
struct TrendingDatum: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var logo: String?
    var description: String?
    var distance: String?
    var type, status: Int?
    var lat, lng, address, appointments: String?
    var trending, popular: Int?
    var rate: String?
    var isFavorite: Bool?
    var categories: [Category]?
    var token: String?
    var information: Information?
    var productCategories: [ProductCategory]?

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, image, logo, description, distance, type, status, lat, lng, address, appointments, trending, popular, rate
        case isFavorite = "is_favorite"
        case categories, token, information
        case productCategories = "product_categories"
    }
}

 

// MARK: - CategoriesModel
struct CategoriesModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?
    var data: CategoriesDataClass?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - DataClass
struct CategoriesDataClass: Codable {
    var data: [CategoriesDatum]?
    var cartCount: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case cartCount = "cart_count"
    }
}

// MARK: - Datum
struct CategoriesDatum: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var active: Int?
    var nameAr, nameEn: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, active
        case nameAr = "name_ar"
        case nameEn = "name_en"
    }
}


// MARK: - FavModel
struct FavModel: Codable {
    var success: Bool?
    var responseCode: Int?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message
    }
}
 
