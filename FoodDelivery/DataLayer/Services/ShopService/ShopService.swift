//
//  ShopService.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Moya

protocol ShopService {
    func shops() -> AnyPublisher<[ShopResponseItem], Error>
    
 }

class ShopServiceImpl: ShopService {

    let provider: MoyaProvider<ShopTarget>
    
    init(provider: MoyaProvider<ShopTarget>)  {
        self.provider = provider
    }
    
    func shops() -> AnyPublisher<[ShopResponseItem], Error> {
        provider.requestPublisher(.shops, callbackQueue: DispatchQueue.main)
            .decode(type: [ShopResponseItem].self)
            .eraseToAnyPublisher()
    }
}
