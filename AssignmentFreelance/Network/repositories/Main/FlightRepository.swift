//
//  FlightRepository.swift
//  InterviewPrep
//
//  Created by dilshad haidari on 06/06/25.
//



protocol FlightDataRepository: AnyObject{
    
    func getFlightData(requestParam flightRequest: FlightSearchRequest, completion: @escaping ([FlightJourneyInfoElement]?, Error?) -> Void )
    
    func getFlightDataWithAsyncAwait(requestParam flightRequest: FlightSearchRequest) async throws -> [FlightJourneyInfoElement]
}


class FlightRepositoryProvider: FlightDataRepository{
    
    let networkExecutor: NetworkProtocol
    let jsonEncoder: JSONEncoderDecoder
    
    init(networkExecutor: NetworkProtocol, jsonEncoder: JSONEncoderDecoder) {
        self.networkExecutor = networkExecutor
        self.jsonEncoder = jsonEncoder
    }
    
    
    func getFlightData(requestParam flightRequest: FlightSearchRequest, completion: @escaping ([FlightJourneyInfoElement]?, Error?) -> Void ){
        
        networkExecutor.executeRequestWithCompletionBlock(request: flightRequest) { data, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let result : ([FlightJourneyInfoElement]?, Error?) = self.jsonEncoder.jsonDecode(data: data)
            completion(result.0, result.1)
        }
    }
    
    func getFlightDataWithAsyncAwait(requestParam flightRequest: FlightSearchRequest) async throws -> [FlightJourneyInfoElement] {
        
        let data = try await networkExecutor.executeRequestWithAsyncAwait(request: flightRequest)
        
        let result: [FlightJourneyInfoElement] = try self.jsonEncoder.jsonDecodeWithAsync(data: data)
        
        return result
        
    }
    
    
    
    
}
