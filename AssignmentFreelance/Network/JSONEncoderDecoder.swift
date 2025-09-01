//
//  JSONEncoderDecoder.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation

protocol JSONEncoderDecoder{
    func jsonDecode<T>(data: Data) -> (response: T?, error: Error?) where T : Codable
    func decodeResponseData<T>(data: Data) -> (resultModel: BaseResponse<T>?, error: Error?)
    
    func jsonDecodeWithAsync<T: Codable>(data: Data) throws -> T
    func decodeResponseDataWithAsync<T: Codable>(data: Data) throws -> BaseResponse<T>
    
}


class SwiftJsonDecoder: JSONEncoderDecoder{
   
    
    let decoder = JSONDecoder()
    
    func decodeResponseData<T>(data: Data) -> (resultModel: BaseResponse<T>?, error: (any Error)?) where T : Decodable, T : Encodable {
        do {
            print("--------------------\n\n")
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print("json :", json)
    
            print("resp : ", try decoder.decode(BaseResponse<T>.self, from: data))
            let response = try decoder.decode(BaseResponse<T>.self, from: data)
            print("response : ", response)
            print("response after decoding :", response)
            return (response, nil)
        } catch {
    
    //            Logger.error(error)
            return (nil, error)
        }
    }


    
        func jsonDecode<T>(data: Data) -> (response: T?, error: Error?) where T: Encodable, T: Decodable{
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("--------------------\n\n")
                print("json \(json)")
    
                let result = try decoder.decode(T.self, from: data)
                return (result, nil)
    
            } catch{
                return (nil, error)
            }
        }
    
    
    
    func jsonDecodeWithAsync<T>(data: Data) throws -> T where T : Decodable, T : Encodable {
        
        let result = try decoder.decode(T.self, from: data)
        return result
    }
    
    func decodeResponseDataWithAsync<T>(data: Data) throws -> BaseResponse<T> where T : Decodable, T : Encodable {
        
        let result: BaseResponse<T> = try decoder.decode(BaseResponse<T>.self, from: data)
        return result
    }
    
    
}


//func decodeResponseData<T>(data: Data) -> (resultModel: BaseResponse<T>?, error: (any Error)?) where T : Decodable, T : Encodable {
//    do {
//        print("--------------------\n\n")
//        let json = try JSONSerialization.jsonObject(with: data, options: [])
//        print("json :", json)
//        
//        print("resp : ", try decoder.decode(BaseResponse<T>.self, from: data))
//        let response = try decoder.decode(BaseResponse<T>.self, from: data)
//        print("response : ", response)
//        print("response after decoding :", response)
//        return (response, nil)
//    } catch {
//        
////            Logger.error(error)
//        return (nil, error)
//    }
//}


//
//    func jsonDecode<T>(data: Data) -> (response: T?, error: Error?) where T: Encodable, T: Decodable{
//        do{
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            print("--------------------\n\n")
//            print("json \(json)")
//
//            let result = try decoder.decode(T.self, from: data)
//            return (result, nil)
//
//        } catch{
//            return (nil, error)
//        }
//    }
//
