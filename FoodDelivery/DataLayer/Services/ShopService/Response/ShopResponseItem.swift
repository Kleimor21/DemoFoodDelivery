//
//  ShopResponseItem.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

struct ShopResponseItem: Decodable {
    let id: String
    let deliveryTime: Double?
    let kind: Kind
    let icon: String
    let name: String
    let price: Double?
    let description: String?
    
    enum Kind: String, Decodable {
        case restaurant = "restaurant"
        case menu = "menu"
    }
}
