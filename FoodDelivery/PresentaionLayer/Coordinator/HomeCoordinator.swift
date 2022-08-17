//
//  HomeCoordinator.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit
import Combine
import Moya

class HomeCoordinator: BaseCoordinator<Void> {
    
    private let coordinatorFactory: CoordinatorFactory
    private let navigationController: UINavigationController
    
    init(coordinatorFactory: CoordinatorFactory, navigationController: UINavigationController) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
        super.init()
    }
    
    override func start() -> AnyPublisher<Void, Never> {
        return Deferred<AnyPublisher<Void, Never>> { [weak self] in
            guard let self = self else { return Empty<Void, Never>(completeImmediately: false).eraseToAnyPublisher() }
      
            self.showStartScreen()
            
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    private func showStartScreen() {
        
        let provider = MoyaProvider<ShopTarget>(plugins: [])
        let shopService: ShopService = ShopServiceImpl(provider: provider)
        
        let viewModel = HomeViewModel(shopService: shopService)
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewModel.mapScrenEvent.sink { [weak self] _ in
            print("переход")
           
            self?.showOrderMap()
        }.store(in: &cancellables)
        
        viewModel.filterEvent.sink { [weak self] _ in
            print("переход на оплату ")
            
            self?.editPaymentsView()
        }.store(in: &cancellables)

        navigationController.setViewControllers([viewController], animated: true) 
    }
    
    private func  showOrderMap() {
        
        let viewModel = OrderMapViewModel()
        let viewController = OrderMapViewController(viewModel: viewModel)
        
        viewModel.backEvent.sink { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }.store(in: &cancellables)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func  editPaymentsView() {
        
        let provider = MoyaProvider<PaymentTarget>(plugins: [])
        let paymentService: PaymentService = PaymentServiceImpl(provider: provider)
        
        let viewModel = EditPaymentsViewModel(paymentService: paymentService)
        let viewController = EditPaymentsViewController(viewModel: viewModel)
       
        viewModel.payBackEvent.sink { [weak self] in
            print("возврат на хом с оплаты ")
            self?.navigationController.popViewController(animated: true)
        }.store(in: &cancellables)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
