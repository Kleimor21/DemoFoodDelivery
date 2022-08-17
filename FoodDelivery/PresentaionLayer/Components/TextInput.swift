//
//  TextInput.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import UIKit

class TextInput: UIView {
    
    let textField = UITextField()
    private let imageView = UIImageView()
    private let eyeButton = UIButton()
    private var cancellableSet = Set<AnyCancellable>()
    private let icon: UIImage?
    private let isPassword: Bool
    private var isShowPassword = false
    
    init(icon: UIImage?, isPassword: Bool) {
        self.icon = icon
        self.isPassword = isPassword
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
        setupBindings()
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
        
        addSubview(textField)
        
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 14)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        if let icon = icon {
            addSubview(imageView)
            imageView.image = icon
        }
        if isPassword {
            textField.isSecureTextEntry = true
            
            addSubview(eyeButton)
            
            eyeButton.setImage(R.image.icon_eye_opened(), for: .normal)
        }
    }
    
    private func setupConstraintes() {
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        if icon != nil {
            imageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(20)
                make.size.equalTo(24)
            }
            textField.snp.makeConstraints { make in
                make.left.equalTo(imageView.snp.right).offset(16)
            }
        } else {
            textField.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(24)
            }
        }
        
        if isPassword {
            eyeButton.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-20)
                make.size.equalTo(24)
            }
            textField.snp.makeConstraints { make in
                make.right.equalTo(eyeButton.snp.left).offset(-16)
            }
        } else {
            textField.snp.makeConstraints { make in
                make.right.equalToSuperview().offset(-28)
            }
        }
    }
    
    private func setupBindings() {
        
        eyeButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.isShowPassword.toggle()
            
            if self.isShowPassword {
                self.textField.isSecureTextEntry = false
                self.eyeButton.setImage(R.image.icon_eye_closed(), for: .normal)
            } else {
                self.textField.isSecureTextEntry = true
                self.eyeButton.setImage(R.image.icon_eye_opened(), for: .normal)
            }
            
        }.store(in: &cancellableSet)
    }
}
