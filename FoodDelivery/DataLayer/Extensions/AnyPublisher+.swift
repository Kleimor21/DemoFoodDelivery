//
//  AnyPublisher+.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine

extension AnyPublisher {
    static var empty: AnyPublisher {
        Empty()
            .eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> Self {
        Just(output)
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
    }

    static func fail(error: Failure) -> Self {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
}
