//
//  VerifyLogin.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 06/04/25.
//

import Foundation
//import Alamofire

struct VerifyLoginRequest: RequestProtocol{
    
    var email :  String
    var otp: String
    
    init(email: String, otp: String) {
        self.email = email
        self.otp = otp
    }
    
    var baseUrl: String = Constants.baseUrl
    
    var path: String {
        Path.verifyLogin.rawValue
    }
    
    var header: [String : String] = ["Content-Type": "application/json"]
    
    var method: HTTPMethod = HTTPMethod.post
    
    var parameters: [String : Any]? {
    return  [
            "email":email,
            "otp":otp
        ]
    }
    
    
}
