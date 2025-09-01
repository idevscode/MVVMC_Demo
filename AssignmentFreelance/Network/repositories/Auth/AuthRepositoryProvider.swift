//
//  AuthRepositoryProvider.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation

class AuthRepositoryProvider: AuthRepository{
    
    var networkExecutor: NetworkProtocol
    var jsonDecoder: JSONEncoderDecoder
    init(networkExecutor: NetworkProtocol, jsonDecoder: JSONEncoderDecoder) {
        self.networkExecutor = networkExecutor
        self.jsonDecoder = jsonDecoder
        
    }
    
    
    
    func register(email: String, userName: String, completion: @escaping (SuccessResponse?, Error?) -> Void) {
        let registerRequest = RegisterRequest(email: email, userName: userName)
        
        networkExecutor.executeRequestWithCompletionBlock(request: registerRequest) { data, error in
            if data != nil {
                let result: (response: SuccessResponse?, error: Error?) = self.jsonDecoder.jsonDecode(data: data!)
                completion(result.response, nil)
               
            } else{
                completion(nil, error)
            }
            
        }
    }
    
    func verifyRegister(email: String, otp: String, completion: @escaping (SuccessResponse?, Error?) -> Void) {
        let registerRequest = VerifyRegisterRequest(email: email, otp: otp)
        
        networkExecutor.executeRequestWithCompletionBlock(request: registerRequest) { data, error in
            if data != nil {
                let result: (response: SuccessResponse?, error: Error?) = self.jsonDecoder.jsonDecode(data: data!)
                completion(result.response, nil)
               
            } else{
                completion(nil, error)
            }
            
        }
    }
    
    
    
    func login(email: String, completion: @escaping (SuccessResponse?, Error?) -> Void) {
        
        let loginRequest = LoginRequest(email: email)
        
        networkExecutor.executeRequestWithCompletionBlock(request: loginRequest) { data, error in
            if data != nil {
                let result: (response: SuccessResponse?, error: Error?) = self.jsonDecoder.jsonDecode(data: data!)
                completion(result.response, nil)
               
            } else{
                completion(nil, error)
            }
        }
    }
    
    func loginReqRes(email: String, password: String, completion: @escaping (Codable?, Error?) -> Void) {
        
        let loginRequest = LoginRequestReqRES(email: email, password: password)
        
        networkExecutor.executeRequestWithCompletionBlock(request: loginRequest) { data, error in
            if data != nil {
                let result: (response: LoginModelReqRes?, error: Error?) = self.jsonDecoder.jsonDecode(data: data!)
                completion(result.response, nil)
               
            } else{
                completion(nil, error)
            }
        }
    }
    
    func verifyLogin(email: String, otp: String, completion: @escaping (SuccessResponse?, (any Error)?) -> Void) {
        let verifyLoginRequest = VerifyLoginRequest(email: email, otp: otp)
        
        networkExecutor.executeRequestWithCompletionBlock(request: verifyLoginRequest) { data, error in
            if data != nil {
                let result: (response: SuccessResponse?, error: Error?) = self.jsonDecoder.jsonDecode(data: data!)
                completion(result.response, nil)
               
            } else{
                completion(nil, error)
            }
            
        }
    }
    
    
}
