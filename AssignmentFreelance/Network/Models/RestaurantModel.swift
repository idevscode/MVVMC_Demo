//
//  RestaurantModel.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 27/03/25.
//

import Foundation

import Foundation
import UIKit

// MARK: - Restaurant
struct RestaurantArrayModel: Codable {
    let restaurant: [RestaurantModel]

    enum CodingKeys: String, CodingKey {
        case restaurant = "Restaurant"
    }
}

// MARK: - RestaurantElement
struct RestaurantModel: Decodable, Encodable, Identifiable, Hashable {
    let id, restaurantName: String
    let estimatedTime: Int
    let cuisine: String
    let v: Int
    var topPickProductId: String?
    var image: UIImage = UIImage()
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case restaurantName = "restaurant_Name"
        case estimatedTime, cuisine
        case v = "__v"
    }
    
    // Implementing Hashable manually
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        // Equatable conformance (if needed)
        static func == (lhs: RestaurantModel, rhs: RestaurantModel) -> Bool {
            return lhs.id == rhs.id
        }
    
    var imageUrl: String {
        Constants.restaurantPhotoBaseUrl + id
    }
}
