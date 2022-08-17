//
//  UIButton+Combine.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

extension UIButton {

    var tapPublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchUpInside)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
