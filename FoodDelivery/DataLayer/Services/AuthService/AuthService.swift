//
//  AuthService.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Moya

protocol AuthService {
    func signUp(payload: SignUpPayload) -> AnyPublisher<String, Error>
    func signIn(payload: SignInPayload) -> AnyPublisher<String, Error>
 }

class AuthServiceImpl: AuthService {

    let provider: MoyaProvider<AuthTarget>
    
    init(provider: MoyaProvider<AuthTarget>)  {
        self.provider = provider
    }
    
    func signUp(payload: SignUpPayload) -> AnyPublisher<String, Error> {
        provider.requestPublisher(.signUp(payload), callbackQueue: DispatchQueue.main)
            .decode(type: SignUpResponse.self)
            .map(\.idToken)
            .eraseToAnyPublisher()
    }
    
    func signIn(payload: SignInPayload) -> AnyPublisher<String, Error> {
        provider.requestPublisher(.signIn(payload), callbackQueue: DispatchQueue.main)
            .decode(type: SignInResponse.self)
            .map(\.idToken)
            .eraseToAnyPublisher()
    }
}
