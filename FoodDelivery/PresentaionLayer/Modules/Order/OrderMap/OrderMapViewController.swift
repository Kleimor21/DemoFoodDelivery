//
//  OrderMapViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine
import GoogleMaps

class OrderMapViewController: UIViewController {
    
    let rootView = OrderMapView()
    let viewModel: OrderMapViewModel

    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: OrderMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    private func setupBindings() {
        rootView.beckButton.tapPublisher
            .subscribe(viewModel.backEvent)
            .store(in: &cancellableSet)
        
        rootView.mapView.delegate = self
    }
}
 
extension OrderMapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        let coordinates = Coordinates(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        print(" Controller Нажали на карту", coordinates )
        
        viewModel.coordinatesEvent.send(coordinates)
    }
}
