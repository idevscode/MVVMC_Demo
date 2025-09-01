//
//  BaseResponse.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation

public struct BaseResponse<T: Codable> : Codable {
    var result: T?
}
