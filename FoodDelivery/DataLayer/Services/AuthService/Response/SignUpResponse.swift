//
//  SignUpResponse.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

struct SignUpResponse: Decodable {
    
    let idToken: String
    let refreshToken: String
    let expiresIn: String
}
