//
//  MenuItemModel.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 31/03/25.
//

import Foundation

// MARK: - RestaurantModel
struct MenuItemListModel: Codable {
    let products: [MenuItemModel]
}

// MARK: - Product
struct MenuItemModel: Codable {
    let id, productName: String
    let productPrice: Int
    let availability: Bool
    let foodCategory, description, restaurantID: String
    let quantity, v: Int
    let topPicks: Bool
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName = "product_name"
        case productPrice = "product_price"
        case availability
        case foodCategory = "food_category"
        case description
        case restaurantID = "restaurant_id"
        case quantity
        case v = "__v"
        case topPicks = "top_picks"
        case rating
    }
    
    var imageUrl: String {
        Constants.menuItemPhotoBaseUrl + id
    }

    // ✅ Custom Decoder to Handle Different Rating Formats
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        productName = try container.decode(String.self, forKey: .productName)
        productPrice = try container.decode(Int.self, forKey: .productPrice)
        availability = try container.decode(Bool.self, forKey: .availability)
        foodCategory = try container.decode(String.self, forKey: .foodCategory)
        description = try container.decode(String.self, forKey: .description)
        restaurantID = try container.decode(String.self, forKey: .restaurantID)
        quantity = try container.decode(Int.self, forKey: .quantity)
        v = try container.decode(Int.self, forKey: .v)
        topPicks = try container.decode(Bool.self, forKey: .topPicks)

        // Handle `rating` as either String or Double
        if let ratingStringRaw = try? container.decode(String.self, forKey: .rating),
               let ratingDouble = Double(ratingStringRaw) {
                rating = ratingDouble
//                ratingInString = String(format: "%.2f", ratingDouble)
            } else if let ratingDouble = try? container.decode(Double.self, forKey: .rating) {
                rating = ratingDouble
//                ratingInString = String(format: "%.2f", ratingDouble)
            } else {
                rating = 0.0
//                ratingInString = "0.00"
        }
    }
    
    
    
    var formattedRating: String {
            String(format: "%.2f", Double(rating))
    }
    
}



