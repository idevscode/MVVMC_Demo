//
//  RegisterRequest.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 06/04/25.
//

import Foundation
//import Alamofire

struct RegisterRequest: RequestProtocol{
    
    
    var email :  String
    var userName: String
    
    init(email: String, userName: String) {
        self.email = email
        self.userName = userName
    }
    var baseUrl: String = Constants.baseUrl
    
    var path: String {
        Path.register.rawValue
    }
    
    var header: [String : String] = ["Content-Type": "application/json"]
    
    var method: HTTPMethod = HTTPMethod.post
    
    var parameters: [String : Any]? {
    return  [
            "email":email,
            "username":userName
        ]
    }
    
    
}
