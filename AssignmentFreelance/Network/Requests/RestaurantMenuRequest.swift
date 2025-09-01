//
//  RestaurantMenuRequests.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 31/03/25.
//

import Foundation
//import Alamofire

class RestaurantMenuRequest: RequestProtocol{
    let restaurantId: String
    
    init( restaurantId: String ) {
        self.restaurantId = restaurantId
        
    }
    
    var path: String {
        Path.getAllProducts.rawValue + "/\(restaurantId)"
    }
    var method: HTTPMethod = HTTPMethod.get
    
    var parameters: [String : Any]? {
        return nil
    }
    
   
}
