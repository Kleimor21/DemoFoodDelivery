//
//  MainCoordinator.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit
import Combine

class MainCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    private let coordinatorFactory: CoordinatorFactory
    private let flowCompleted = PassthroughSubject<Void, Never>()
    private let tokenManager: TokenManager
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactory, tokenManager: TokenManager) {
        self.window = window
        self.tokenManager = tokenManager
        self.coordinatorFactory = coordinatorFactory
        super.init()
    }
    
    override func start() -> AnyPublisher<Void, Never> {
        return Deferred<AnyPublisher<Void, Never>> { [weak self] in
            guard let self = self else { return Empty(completeImmediately: false).eraseToAnyPublisher() }
            
            self.showMainScreen()
            
            return self.flowCompleted.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    private func showMainScreen() {
        
        let home = creatHomeCoordinator()
        let profile = createProfileTab()
        let cart = createCartTab()
        let chat = createChatTab()
        
        coordinate(to: home.coordinator).sink {}.store(in: &cancellables)
        
        let controller = MainController()
        controller.view.backgroundColor = .red
        
        controller.setViewControllers([home.viewController, profile, cart, chat], animated: false)
        
        window.rootViewController = controller
    }
    
    private func creatHomeCoordinator() -> (coordinator: HomeCoordinator, viewController: UINavigationController) {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        let homeCoordinator = coordinatorFactory.createHomeCoordinator(navigationController: navigationController)
        
        return (homeCoordinator, navigationController)
    }
    
    private func createProfileTab() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .black
        
        return controller
    }
    
    private func createCartTab() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .green
        
        return controller
    }
    
    private func createChatTab() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .gray
        
        return controller
    }
}
