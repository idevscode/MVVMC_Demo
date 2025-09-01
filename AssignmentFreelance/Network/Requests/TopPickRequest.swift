//
//  TopPickRequest.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 09/04/25.
//

import Foundation
//import Alamofire

class TopPickRequests: RequestProtocol{
    
    var path: String {
        Path.topPicks.rawValue
    }
    
    var method: HTTPMethod = HTTPMethod.get
    
    var parameters: [String : Any]?
    
   
}
