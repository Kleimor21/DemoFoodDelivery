//
//  OrderMapViewModel.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import Alamofire

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

class OrderMapViewModel: ObservableObject {
    let backEvent = PassthroughSubject<Void, Never>()
    let coordinatesEvent = PassthroughSubject<Coordinates, Never>()
    
    private var cancellableSet = Set<AnyCancellable>()
    
    init() {
        
        setupBingings()
    }
    
    private func setupBingings() {
        
        coordinatesEvent
            .sink(receiveValue: { coordinates in
                print(" ViewModel Нажали на карту", coordinates )
                
                NotificationCenter.default.post(name: .mapCoordinates, object: coordinates)
                
            }).store(in: &cancellableSet)
    }
}

extension NSNotification.Name {
    static let mapCoordinates = Notification.Name(rawValue: "coordinates")
}
