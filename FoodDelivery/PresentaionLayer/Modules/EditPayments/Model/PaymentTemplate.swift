//
//  PaymentTemplate.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

struct PaymentTemplate: Hashable {

    let id: String
    let cardNumber: String
    let type: PaymentType
}

enum PaymentType: String {
    case paypal
    case visa
    case payoneer
    case unknown
}
