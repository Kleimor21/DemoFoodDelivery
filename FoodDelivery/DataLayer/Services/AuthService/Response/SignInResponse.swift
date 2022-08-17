//
//  SignInResponse.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

struct SignInResponse: Decodable {
    
    let idToken: String
    let refreshToken: String
    let expiresIn: String
}
