//
//  SuccessResponse.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 06/04/25.
//

import Foundation

// MARK: - SuccessResponse
struct SuccessResponse : Codable{
    let success: Bool?
    let message, username, id: String?
}
