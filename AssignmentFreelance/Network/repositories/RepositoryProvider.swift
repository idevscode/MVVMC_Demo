//
//  RepositoryProvider.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation

protocol RepositoryProvider {
    var authRepository: AuthRepository {get}
    var mainRepository: MainRepository {get}
    var flightRepository: FlightDataRepository {get}
    
}



