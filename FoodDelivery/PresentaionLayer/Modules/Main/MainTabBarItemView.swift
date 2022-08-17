//
//  MainTabBarItemView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit
import Combine

class MainTabBarItemView: UIView {
    
    private let tapSubject = PassthroughSubject<Void, Never>()
    var tapPublisher: AnyPublisher<Void, Never> {
        tapSubject.eraseToAnyPublisher()
    }
   
    var isSelectad: Bool = false {
        didSet {
            backgroundColor = isSelectad ? R.color.green_Light()?.withAlphaComponent(0.1) : .clear
            label.isHidden = !isSelectad
        }
    }
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()
    
    init(icon: UIImage, text: String) {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
        
        imageView.image = icon
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = R.color.green_Light()?.withAlphaComponent(0.1)
        layer.cornerRadius = 12
        
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = R.color.text_black()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        tapSubject.send(())
        
    }
}
