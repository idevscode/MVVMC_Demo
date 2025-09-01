//
//  Constants.swift
//  RxSwiftTut
//
//  Created by dilshad haidari on 24/03/25.
//  Copyright © 2025 com.thinkbiz. All rights reserved.
//

import Foundation

class Constants{
    static let baseUrl = "https://qskipperbackend.onrender.com/"
    //Dev
   static let restaurantPhotoBaseUrl = "\(baseUrl)get_restaurant_photo/"
   static let menuItemPhotoBaseUrl = "\(baseUrl)get_product_photo/"
    
    
}

struct ReqResConstants{
    static let baseUrl = "https://reqres.in"
   
    
}

enum ReqResPath{
    static let login = "/api/login"
}


/*
 [29/03/25, 12:37:41 PM] ~ Keshav Lohiya: 
 Router.get('/get_all_product/:pid' , get_All_Product)

 Router.get("/get_product_photo/:pid" , get_Product_Photo)


 Router.get("/top-picks" , topPicks)

 Router.post("/order-placed", OrderPlaced)

 Router.get("/order-status/:oid", updateOnOrder)

 Router.get("/get-UserOrder/:pid", userOrders)
 [29/03/25, 12:37:58 PM] ~ Keshav Lohiya: Router.get("/get_All_Restaurant" , get_All_resturant)

 Router.get("/get_restaurant_photo/:pid" , get_Retrurant_Photo)

 Router.get("/get-order/:pid" , resturantOrders)
 */
enum Path: String{
    case login = "login"
    case register = "register"
    case verifyRegister = "verify-register"
    case verifyLogin = "verify-login"
    
    case getAllRestaturants = "get_All_Restaurant"
    case getAllProducts = "get_all_product"
    case getProductPhoto = "get_product_photo"
    case topPicks = "top-picks"
    
    case orderPlaced = "order-placed"
    case orderStatus = "order-status"
    case getUserOrder = "get-UserOrder"
    case getOrder = "get-order"
    
}


