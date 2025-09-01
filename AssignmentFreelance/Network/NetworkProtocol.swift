//
//  NetworkProtocol.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation


protocol NetworkProtocol{
    
    func executeRequestWithCompletionBlock(request: RequestProtocol, completion: @escaping NetworkCompletion)
    
    func executeRequestWithAsyncAwait(request: RequestProtocol) async throws -> Data
}


