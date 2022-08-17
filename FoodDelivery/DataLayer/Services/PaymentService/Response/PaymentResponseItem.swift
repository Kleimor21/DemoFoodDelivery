//
//  PaymentResponseItem.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

struct PaymentResponseItem: Decodable {
    let id: String
    let number: String
    let type: String
}
