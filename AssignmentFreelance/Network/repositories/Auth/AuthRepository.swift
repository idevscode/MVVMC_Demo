//
//  AuthRepository.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation


protocol AuthRepository: AnyObject{
    
    func register(email: String, userName: String, completion: @escaping (SuccessResponse?, Error?) -> Void)
    
    func verifyRegister(email: String, otp: String, completion: @escaping (SuccessResponse?, Error?) -> Void)
    
    func login(email: String, completion: @escaping (SuccessResponse?, Error?) -> Void)
    
    func verifyLogin(email: String, otp: String, completion: @escaping (SuccessResponse?, Error?) -> Void)
    
    func loginReqRes(email: String, password: String, completion: @escaping (Codable?, Error?) -> Void)
    
    
    
}




