//
//  ApplicationCoordinator.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit
import Combine
import Moya
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<Void> {
    
    private let mainWindow: UIWindow
    private let coordinatorFactory: CoordinatorFactory
    private let navigationController = UINavigationController()
    
    @Persist(Key: "isOnboardingShowed", defaultValue: false)
    private var isOnboardingShowed: Bool
    private let tokenManager: TokenManager
    
    init(mainWindow: UIWindow, coordinatorFactory: CoordinatorFactory, tokenManager: TokenManager) {
        self.mainWindow = mainWindow
        self.tokenManager = tokenManager
        self.coordinatorFactory = coordinatorFactory
        super.init()
        
        navigationController.navigationBar.isHidden = true
    }
    
    override func start() -> AnyPublisher<Void, Never> {
        
        Deferred<AnyPublisher<Void, Never>> { [weak self] in
            guard let self = self else { return Empty(completeImmediately: false).eraseToAnyPublisher() }
            
            self.runApplicationFlow()
            self.mainWindow.makeKeyAndVisible()
            
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    private func runApplicationFlow() {
        mainWindow.rootViewController = navigationController
        
        if tokenManager.isAuthorized {
            runMainFlow()
            return
        }
        
        if isOnboardingShowed {
            runSignInFlow()
        }
        else {
            runOnboardingFirst()
        }
    }
    
    private func runOnboardingFirst() {
        
        let viewModel = OnboardingFirstViewModel()
        let viewController = OnboardingFirstViewController(viewModel: viewModel)
        
        viewModel.nextEvent.sink { [weak self]  in
            
            self?.runOnboardingSecond()
            
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func runOnboardingSecond() {
        
        let viewModel = OnboardingSecondViewModel()
        
        let view = NewOnboardingSecondView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        viewModel.nextEvent.sink { [weak self]  in
            
            self?.isOnboardingShowed = true
            self?.runSignInFlow()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runSignInFlow() {
        
        let provider = MoyaProvider<AuthTarget>(plugins: [])
        let authService: AuthService = AuthServiceImpl(provider: provider)
        let viewModel = SignInViewModel(authService: authService, tokenManager: TokenManager.shered)
        let viewController = SignInViewController(viewModel: viewModel)
        
        viewModel.signUpEvent.sink { [weak self] _ in
            self?.runSignUpFlow()
        }.store(in: &cancellables)
        
        viewModel.signInSuccessEvent.sink { [weak self] _ in
            self?.runMainFlow()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runSignUpFlow() {
        
        let provider = MoyaProvider<AuthTarget>(plugins: [])
        let authService: AuthService = AuthServiceImpl(provider: provider)
        let viewModel = SignUpViewModel(authService: authService, tokenManager: TokenManager.shered)
        let viewController = SignUpViewController(viewModel: viewModel)
        
        viewModel.signInEvent.sink { [weak self] _ in
            self?.runSignInFlow()
        }.store(in: &cancellables)
        
        viewModel.signUpSuccessEvent.sink { [weak self] _ in
            self?.runCompletionRegistration()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runMainFlow() {
        let coordinator = coordinatorFactory.createMainCoordinator(window: mainWindow)
        
        coordinate(to: coordinator).sink { [weak self]  _ in
            
            self?.mainWindow.rootViewController = self?.navigationController
            self?.runSignInFlow()
            
        }.store(in: &cancellables)
    }
    
    private func runCompletionRegistration() {
        
        let viewModel = CompletionRegistrationViewModel()
        let viewController = CompletionRegistrationViewController(viewModel: viewModel)
        
        viewModel.nextEvent.sink { [weak self]  in
            
            self?.runMainFlow()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
}
