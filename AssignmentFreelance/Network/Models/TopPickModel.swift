//
//  TopPickModel.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 09/04/25.
//

import Foundation

// MARK: - TopPickModel
// MARK: - TopPickModel
struct TopPickArrayModel: Codable {
    let allTopPicks: [TopPickModel]
}

// MARK: - AllTopPick
struct TopPickModel: Codable, Identifiable {
    let numberOfPeopleRate: Int
        let id, productName: String
        let productPrice: Int
        let topPicks, availability: Bool
        let foodCategory, description: String
        let extraTime: Int
        let restaurantID: String
        let quantity, v: Int
        let rating: Double

    enum CodingKeys: String, CodingKey {
        case numberOfPeopleRate
        case id = "_id"
        case productName = "product_name"
        case productPrice = "product_price"
        case topPicks = "top_picks"
        case availability
        case foodCategory = "food_category"
        case description, extraTime
        case restaurantID = "restaurant_id"
        case quantity
        case v = "__v"
        case rating
    }
    
    var imageUrl: String {
        Constants.menuItemPhotoBaseUrl + id
    }
    
    var formattedRating: String {
            String(format: "%.2f", Double(rating))
    }
}
