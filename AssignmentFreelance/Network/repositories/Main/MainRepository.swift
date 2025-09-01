//
//  MainRepository.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation


protocol MainRepository: AnyObject {
    
    func getAllRestaurants(completion: @escaping (RestaurantArrayModel?, Error?) -> Void)
    
    func getRestaurantMenu(restaurantId: String, completion: @escaping (MenuItemListModel?, Error?) -> Void)
    
    func getTopPick(completion: @escaping ([TopPickModel]?, Error?) -> Void)
    
}
