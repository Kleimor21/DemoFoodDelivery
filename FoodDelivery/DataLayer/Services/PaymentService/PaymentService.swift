//
//  PaymentService.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Moya

protocol PaymentService {
    func payment() -> AnyPublisher<[PaymentResponseItem], Error>
 }

class PaymentServiceImpl: PaymentService {

    let provider: MoyaProvider<PaymentTarget>
    
    init(provider: MoyaProvider<PaymentTarget>)  {
        self.provider = provider
    }
    
    func payment() -> AnyPublisher<[PaymentResponseItem], Error> {
        provider.requestPublisher(.payment, callbackQueue: DispatchQueue.main)
            .decode(type: [PaymentResponseItem].self)
            .eraseToAnyPublisher()
    }
}
