//
//  GetAllRestaurantsRequests.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 27/03/25.
//

import Foundation
//import Alamofire

class GetAllRestaurantsRequests: RequestProtocol{
    
    var path: String {
        Path.getAllRestaturants.rawValue
    }
    
    var method: HTTPMethod = HTTPMethod.get
    
    var parameters: [String : Any]?
    
   
}
