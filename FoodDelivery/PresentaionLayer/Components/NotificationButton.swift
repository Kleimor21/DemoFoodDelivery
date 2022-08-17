//
//  NotificationButton.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit
import Combine

class NotificationButton: UIButton {
    
    var iconImageView = UIImageView()
    var isShowBadge = false {
        didSet {
            iconImageView.image = isShowBadge ? R.image.icon_Notifiaction_On() : R.image.icon_Notifiaction_Off()
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 45, height: 45)
    }
    
    private func setupView() {
        
        backgroundColor = R.color.withe_Notification()
        addSubview(iconImageView)
        
        iconImageView.image = R.image.icon_Notifiaction_On()
        layer.cornerRadius = 15
    }
    
    private func setupConstraintes() {
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(24)
        }
    }
}
