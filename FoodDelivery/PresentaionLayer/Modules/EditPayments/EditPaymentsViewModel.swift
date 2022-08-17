//
//  EditPaymentsViewModel.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Alamofire
import Foundation

class EditPaymentsViewModel: ObservableObject {
    
    let viewPaymentDidLoadEvent = PassthroughSubject<Void, Never>()
    let payBackEvent = PassthroughSubject<Void, Never>()
    
    @Published var template: [PaymentTemplate] = []
    
    private var paymentService: PaymentService
    private var cancellableSet = Set<AnyCancellable>()
    
    init(paymentService: PaymentService) {
        self.paymentService = paymentService
        
        setupBingings()
    }
    
    private func setupBingings() {
        
        viewPaymentDidLoadEvent
            .setFailureType(to: Error.self)
            .flatMap { [weak self] _ -> AnyPublisher<[PaymentResponseItem], Error> in
                guard let self = self else { return .empty }
                
                return self.paymentService.payment()
            }
            .sink { completion in
                
                switch completion {
                case let .failure(error):
                    print("Ошибка входа", error)
                    break
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] items in
                print("Iems", items.count)
                guard let self = self else { return }
                self.template = self.createTemplate(items: items)
            }
            .store(in: &cancellableSet)
    }

    private func createTemplate(items: [PaymentResponseItem]) -> [PaymentTemplate] {
        let template = items
            .map { item -> PaymentTemplate in
                let type = PaymentType(rawValue: item.type) ?? PaymentType.unknown
                return PaymentTemplate(id: item.id,
                                       cardNumber: item.number,
                                       type: type)
            }
        return template
    }
}
