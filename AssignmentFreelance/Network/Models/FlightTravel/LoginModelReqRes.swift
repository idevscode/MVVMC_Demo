//
//  LoginModelReqRes.swift
//  FlightTravel
//
//  Created by dilshad haidari on 09/06/25.
//


struct LoginModelReqRes: Codable {
    
    let token: String
    
    enum CodingKeys: CodingKey {
        case token
    }
}
