//
//  UITextField+Combine.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//
//


import Combine
import UIKit.UITextField

public extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.text)
            .dropFirst()
            .map { $0 ?? ""}
            .eraseToAnyPublisher()
    }
}
