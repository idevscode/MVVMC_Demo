//
//  CountriesAndStates.swift
//  FlightTravel
//
//  Created by dilshad haidari on 16/06/25.
//

import Foundation


struct CountryStateModel: Codable, Identifiable, Equatable {
    
    
    let code, name, capital: String
    let states: [StateElement]
    let id = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case code = "code2"
        case name
        case capital
        case states
    }
    
    static func == (lhs: CountryStateModel, rhs: CountryStateModel) -> Bool {
        true
    }
}

// MARK: - State
struct StateElement: Codable, Identifiable, Equatable {
    let code, name: String
    var isSelected: Bool = false
    
    var id = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
    }
    
    static func == (lhs: StateElement, rhs: StateElement) -> Bool {
        true
    }
    
}
