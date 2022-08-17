//
//  IconButton.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//
import Combine
import UIKit

class IconButton: UIView {
    
    private let tapSubject = PassthroughSubject<Void, Never>()
    var tapPublisher: AnyPublisher<Void, Never> {
        tapSubject.eraseToAnyPublisher()
    }
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()

    private var isHighlighted = false {
        didSet {
            stackView.alpha = isHighlighted ? 0.5 : 1 }
    }
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
        return CGSize(width: UIView.noIntrinsicMetric, height: 57)
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = R.color.lightGray()?.cgColor
        
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
    }
    
    private func setupConstraintes() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isHighlighted = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        tapSubject.send(())
        isHighlighted = false
    }
}
