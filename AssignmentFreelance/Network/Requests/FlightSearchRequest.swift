//
//  FlightSearchRequest.swift
//  InterviewPrep
//
//  Created by dilshad haidari on 01/06/25.
//


struct FlightRequestParams{
    let origin: String
    let destination: String
    let departureDate: String
    let returnDate: String
    let page: String
    let currency: String
}

struct FlightSearchRequest : RequestProtocol{
    let flightRequestParams: FlightRequestParams
   
    
//    var header: [String : String] {
//       return theHeader
//    }
    
    var baseUrl: String{
        return "https://my.api.mockaroo.com"
    }
    
    var path: String {
        return "/flight_list.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        [
            "key": "33de8f10"
        ]
    }
    
    
}

var theHeader: [String: String] {
    return ["X-Access-Token" : "321d6a221f8926b5ec41ae89a3b2ae7b"]
}
