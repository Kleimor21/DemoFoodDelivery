//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Alamofire
import Foundation

class HomeViewModel: ObservableObject {
    
    let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    let logoutEvent = PassthroughSubject<Void, Never>()
    let filterEvent = PassthroughSubject<Void, Never>()
    let mapScrenEvent = PassthroughSubject<Void, Never>()
    
    @Published var menus: [HomeMenu] = []
    
    private var shopService: ShopService
    private var cancellableSet = Set<AnyCancellable>()
    
    init(shopService: ShopService) {
        self.shopService = shopService
        
        setupBingings()
    }
    
    private func setupBingings() {
        
        viewDidLoadEvent
            .setFailureType(to: Error.self)
            .flatMap { [weak self] _ -> AnyPublisher<[ShopResponseItem], Error> in
                guard let self = self else { return .empty }
                
                return self.shopService.shops()
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
                self.menus = self.createMenus(items: items)
            }
            .store(in: &cancellableSet)
        
        NotificationCenter.default.publisher(for: .mapCoordinates)
            .sink { notification in
                guard let coordinates = notification.object as? Coordinates else { return }
                
                print("HomeViewModel получили нотификейшен", coordinates)

            }.store(in: &cancellableSet)
    }
    
    private func createMenus(items: [ShopResponseItem]) -> [HomeMenu] {
      let manus = items
            .filter { $0.kind == .menu }
            .map { item -> HomeMenu in
                return HomeMenu(id: item.id,
                                iconUrl: item.icon,
                                titel: item.name,
                                desckription: item.description ?? "",
                                price: item.price ?? 0)
        }
        return manus
    }
}
