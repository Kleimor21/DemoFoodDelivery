//
//  SignUpViewModel.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine

class SignUpViewModel: ObservableObject {

    let signUpEvent = PassthroughSubject<Void, Never>()
    let signUpSuccessEvent = PassthroughSubject<Void, Never>()
    let signInEvent = PassthroughSubject<Void, Never>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSignUpButtonEnabled: Bool = false
    @Published var isLoadingSignUp: Bool = false
    
    private var authService: AuthService
    private var cancellableSet = Set<AnyCancellable>()
    private let tokenManager: TokenManager
    
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
            .assign(to: \.isSignUpButtonEnabled, on: self)
            .store(in: &cancellableSet)
        
        signUpEvent
            .compactMap { [weak self] _ -> SignUpPayload? in
                guard let self = self else { return nil}
                return SignUpPayload(email: self.email, password: self.password)
            }
        
            .setFailureType(to: Error.self)
            .flatMap { [weak self] payload -> AnyPublisher<String, Error> in
                guard let self = self else { return .empty }
                
                self.isLoadingSignUp = true
                return self.authService.signUp(payload: payload)
            }
        
            .sink { [weak self] completion in
                guard let self = self else { return }
                
                self.isLoadingSignUp = false
                
                switch completion {
                case let .failure(error):
                    print("Ошибка регистрации  ", error)
                    
                    break
                case .finished:
                    print("Finished")
                }
                
            } receiveValue: { [weak self] token in
                guard let self = self else { return }
                
                self.isLoadingSignUp = false
                self.tokenManager.saveToken(token)
                self.signUpSuccessEvent.send(())
                print("Успешная регистрация ", token)
            }
            .store(in: &cancellableSet)
    }
}
