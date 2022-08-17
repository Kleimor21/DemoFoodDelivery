//
//  OrderMapView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit
import GoogleMaps

class OrderMapView: UIView {

    let mapView = GMSMapView()
    let beckButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(mapView)
        mapView.addSubview(beckButton)
        
        backgroundColor = .white
        beckButton.setImage(R.image.icon_Back(), for: .normal)
    }
    
    private func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        beckButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(30)
        }
    }
}
