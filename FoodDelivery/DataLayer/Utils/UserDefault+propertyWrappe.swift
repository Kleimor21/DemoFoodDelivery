//
//  UserDefault+propertyWrappe.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation

@propertyWrapper
public struct Persist<T> {
    
    public let Key: String
    public let defaultValue: T
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: Key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Key)
        }
    }
    
    public init(Key: String, defaultValue: T) {
        self.Key = Key
        self.defaultValue = defaultValue
    }
}
