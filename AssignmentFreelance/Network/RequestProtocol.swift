//
//  RequestProtocol.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation
//import Alamofire

protocol RequestProtocol{
    
    var baseUrl: String {get}
    var path: String {get}
    var header: [String: String] {get}
    var method: HTTPMethod {get}
    var parameters: [String: Any]? {get}
    
}

extension RequestProtocol{
    
    var baseUrl: String {
        return Constants.baseUrl
    }
    
 var header: [String : String] {
    return ["Content-Type": "application/json"]
 }
    
    var parameters: [String : Any]?{
        return nil
    }
    
    
}


enum HTTPMethod: String{
    case get  = "GET"
    case post = "POST"
}
