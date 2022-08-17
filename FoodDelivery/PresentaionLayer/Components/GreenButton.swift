//
//  GreenButton.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit

class GreenButton: UIButton {
    
    private let gradient = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = bounds
    }
    
    private func setupView() {
        backgroundColor = .clear
    
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        gradient.colors = [R.color.green_Light()!.cgColor, R.color.green_Global()!.cgColor]
    
        layer.addSublayer(gradient)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)

        titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
    
    private func setupConstraintes() {
        snp.makeConstraints { make in
            make.height.equalTo(57)
            make.width.equalTo(175)
        }
    }
}
