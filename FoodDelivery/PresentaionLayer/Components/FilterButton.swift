//
//  FilterButton.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit

class FilterButton: UIButton {
    
    let iconImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 49, height: 50)
    }
    
    private func setupView() {
        backgroundColor = R.color.orange_Fon()?.withAlphaComponent(0.1)
        addSubview(iconImageView)
        
        iconImageView.image = R.image.icon_Filter()

        layer.cornerRadius = 15
    }
    
    private func setupConstraintes() {
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(24)
        }
    }
}
