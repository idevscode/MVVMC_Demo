//
//  LoginRequest.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation
//import Alamofire

struct LoginRequest: RequestProtocol{
    
    var email :  String
    
    init(email: String) {
        self.email = email
    }
    var baseUrl: String = Constants.baseUrl
    
    var path: String {
        Path.login.rawValue
    }
    
    var header: [String : String] = ["Content-Type": "application/json"]
    
    var method: HTTPMethod = HTTPMethod.post
    
    var parameters: [String : Any]? {
      return ["email": email]
    }
    
}

struct LoginRequestReqRES: RequestProtocol{
    
    let email :  String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    var baseUrl: String = ReqResConstants.baseUrl
    
    var path: String {
        ReqResPath.login
    }
    
    var header: [String : String] = [
        "Content-Type": "application/json",
        "x-api-key": "reqres-free-v1"
    ]
    
    var method: HTTPMethod = HTTPMethod.post
    
    var parameters: [String : Any]? {
        return ["email": email, "password": password]
    }
    
}

