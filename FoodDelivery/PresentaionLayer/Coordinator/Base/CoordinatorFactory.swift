//
//  CoordinatorFactory.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit

class CoordinatorFactory {
    
    func createMainCoordinator(window: UIWindow) -> MainCoordinator {
        return MainCoordinator(window: window, coordinatorFactory: self, tokenManager: TokenManager.shered)
    }
    
    func createHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(coordinatorFactory: self, navigationController: navigationController)
    }
}
