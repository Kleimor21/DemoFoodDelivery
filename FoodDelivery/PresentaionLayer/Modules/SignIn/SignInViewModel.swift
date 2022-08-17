//
//  SignInViewModel.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Alamofire

class SignInViewModel: ObservableObject {
  
    let signInEvent = PassthroughSubject<Void, Never>()
    let signInSuccessEvent = PassthroughSubject<Void, Never>()
    let signUpEvent = PassthroughSubject<Void, Never>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSignInButtonEnabled: Bool = false
    @Published var isLoadingSignIn: Bool = false
    
    private var authService: AuthService
    private let tokenManager: TokenManager
    private var cancellableSet = Set<AnyCancellable>()
    
    init(authService: AuthService, tokenManager: TokenManager) {
        self.authService = authService
        self.tokenManager = tokenManager
        
        setupBingings()
    }
    
    private func setupBingings() {
        
        let isEmailValidPublisher = $email
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isPasswordValidPublisher = $password
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map { $0.0 && $0.1 }
            .assign(to: \.isSignInButtonEnabled, on: self)
            .store(in: &cancellableSet)
        
        signInEvent
            .compactMap { [weak self] _ -> SignInPayload? in
                guard let self = self else { return nil}
                return SignInPayload(email: self.email, password: self.password)
            }
        
            .setFailureType(to: Error.self)
            .flatMap { [weak self] payload -> AnyPublisher<String, Error> in
                guard let self = self else { return .empty}
                
                self.isLoadingSignIn = true
                return self.authService.signIn(payload: payload)
            }
        
            .sink { [weak self] completion in
                guard let self = self else { return }
                
                self.isLoadingSignIn = false
                switch completion {
                case let .failure(error):
                    print("Ошибка входа", error)
                    break
                case .finished:
                    print("Finished SignIn")
                }
                
            } receiveValue: { [weak self] token in
                guard let self = self else { return }
                self.isLoadingSignIn = false
                self.tokenManager.saveToken(token)
                self.signInSuccessEvent.send(())
                
                print("Успешний вход ")
            }.store(in: &cancellableSet)
    }
}
