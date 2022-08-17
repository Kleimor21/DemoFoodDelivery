//
//  SignInPayload.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

struct SignInPayload {
    
    let email: String
    let password: String
    
    var params: [String:Any] {
        [
            "email": email,
            "password": password,
            "returnSecureToken": true
        ]
    }
}
