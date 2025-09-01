//
//  NetworkClient.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation
//import Alamofire

typealias NetworkCompletion = ( _ data: Data?,  _ error: Error?) -> Void

class NetworkClient: NetworkProtocol{
   
    public func executeRequestWithCompletionBlock(request: RequestProtocol, completion: @escaping NetworkCompletion){
        
        guard prepareRequest(request: request) != nil else {return}
        
        URLSession.shared.dataTask(with: prepareRequest(request: request)!) { data, response, error in
            if error == nil{
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }
        .resume()
    }
    
    public func executeRequestWithAsyncAwait(request: RequestProtocol) async throws -> Data{
        
        guard prepareRequest(request: request) != nil else {return Data()}
        
       let (data, response) = try await URLSession.shared.data(for: prepareRequest(request: request)!)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
        
    }
}


    
  func prepareRequest(request: RequestProtocol) -> URLRequest?{
      
        let base = request.baseUrl+request.path
        print("base: \(base)")
     
        guard var urlComponents = URLComponents(string: base) else {
                  print("Invalid base URL or path")
                  return nil
        }


        if request.method == .get, let parameters = request.parameters {
          urlComponents.queryItems = parameters.map {
              URLQueryItem(name: $0.key, value: "\($0.value)")
          }
        }

        guard let finalURL = urlComponents.url else {
          fatalError("Invalid URL") // or handle it gracefully
        }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        request.header.forEach { (key: String, value: String) in
          urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        if request.method == .post, let parameters = request.parameters {
          urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        return urlRequest
  }



