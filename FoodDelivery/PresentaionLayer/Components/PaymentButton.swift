//
//  PaymentButton.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import UIKit

class PaymentButton: UIView {
    
    private let imageView = UIImageView()
    private let label = UILabel()

    init(icon: UIImage?, text: String) {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
        
        imageView.image = icon
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 73)
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(label)
        
        backgroundColor = R.color.medium_Gray()
        layer.cornerRadius = 22
        
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
    }
    
    private func setupConstraintes() {

        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }

        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
}
