//
//  MainRepositoryProvider.swift
//  FoodDeliveryApp
//
//  Created by dilshad haidari on 27/03/25.
//

import Foundation


class MainRepositoryProvider: MainRepository{
    
    
    var networkExecutor: NetworkProtocol
    var jsonDecoder: JSONEncoderDecoder
    init(networkExecutor: NetworkProtocol, jsonDecoder: JSONEncoderDecoder) {
        self.networkExecutor = networkExecutor
        self.jsonDecoder = jsonDecoder
        
    }
    
    
    func getRestaurantMenu(restaurantId: String, completion: @escaping (MenuItemListModel?, (any Error)?) -> Void) {
        
        networkExecutor.executeRequestWithCompletionBlock(request: RestaurantMenuRequest(restaurantId: restaurantId)) { data, error in
            guard let data = data else {
                        completion(nil, error)
                        return
            }
                    
            let result: (response: MenuItemListModel?, error: Error?) = self.jsonDecoder.jsonDecode(data: data)
          /* */ completion(result.response, result.error)
            
        }
    }
    
    
    
    
    
  
    
    
    
    
    func getAllRestaurants(completion: @escaping (RestaurantArrayModel?, Error?) -> Void) {
        
        networkExecutor.executeRequestWithCompletionBlock(request: GetAllRestaurantsRequests()) { data, error in
            guard let data = data else {
                        completion(nil, error)
                        return
            }
                    
            let result: (response: RestaurantArrayModel?, error: Error?) = self.jsonDecoder.jsonDecode(data: data)
            completion(result.response, result.error)
            
        }
    }
    
    func getTopPick(completion: @escaping ([TopPickModel]?, (any Error)?) -> Void) {
        
        networkExecutor.executeRequestWithCompletionBlock(request: TopPickRequests()) { data, error in
            guard let data = data else {
                        completion(nil, error)
                        return
            }
                    
            let result: (response: TopPickArrayModel?, error: Error?) = self.jsonDecoder.jsonDecode(data: data)
            completion(result.response?.allTopPicks, result.error)
        }
    }
    
    
}
