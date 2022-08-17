//
//  BaseCoordinator.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Foundation

class BaseCoordinator<ResultType>: NSObject {
    
    private let id = UUID().uuidString
    private var childCoodrinators: [String: Any] = [:]
    
    var cancellables = Set<AnyCancellable>()
    
    func start() -> AnyPublisher<ResultType, Never> {
        preconditionFailure("Should be overriden")
    }
    
    func coordinate<T>(to coordinator: BaseCoordinator<T>) -> AnyPublisher<T, Never> {
        save(coordinator)
        return coordinator.start().handleEvents(receiveOutput: { [weak self, weak coordinator] _ in
            guard let self = self, let coordinator = coordinator else { return }
            self.remove(coordinator)
        }).eraseToAnyPublisher()
    }
    
    func removeChildren() {
        childCoodrinators.removeAll()
    }
    // MARK: - Private
    private func save<T>(_ coordinator: BaseCoordinator<T>) {
        childCoodrinators[coordinator.id] = coordinator
    }
    
    private func remove<T>(_ coordinator: BaseCoordinator<T>) {
        childCoodrinators[coordinator.id] = nil
    }
}
