//
//  TokenManager.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

class TokenManager {
    
    static let shered = TokenManager()
    
    @Persist(Key: "token", defaultValue: "")
    private var token: String
    
    init() {
        
    }
    
    func saveToken(_ token: String){
        self.token = token
    }
    
    func removeToken() {
        token = ""
    }
    
    var isAuthorized: Bool {
        !token.isEmpty
    }
}
