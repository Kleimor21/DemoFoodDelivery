//
//  MainTabBarView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.

import UIKit
import SnapKit
import Combine

class MainTabBarView: UIView {
    
    private let indexSubject = PassthroughSubject<Int, Never>()
    var indexPublisher: AnyPublisher<Int, Never> {
        indexSubject.eraseToAnyPublisher()
    }

    var selectadIndex: Int = 0 {
        didSet {
            homeItem.isSelectad = selectadIndex == 0
            profileItem.isSelectad = selectadIndex == 1
            cartItem.isSelectad = selectadIndex == 2
            chatItem.isSelectad = selectadIndex == 3
            
            indexSubject.send(selectadIndex)
        }
    }
    
    private let stackView = UIStackView()
    
    private let homeItem = MainTabBarItemView(icon: R.image.tab_Home()!, text: R.string.localization.mainTabHomeItem())
    private let profileItem = MainTabBarItemView(icon: R.image.tab_Profile()!, text: R.string.localization.mainTabProfileItem())
    private let cartItem = MainTabBarItemView(icon: R.image.tab_Cart()!, text: R.string.localization.mainTabCartItem())
    private let chatItem = MainTabBarItemView(icon: R.image.tab_Chat()!, text: R.string.localization.mainTabChatItem())
    
    private var cancellableSet = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 22
        
        dropShadow(opacity: 0.1, offSet: .zero, color: R.color.shadow_Color()!)
        
        addSubview(stackView)
        stackView.addArrangedSubview(homeItem)
        stackView.addArrangedSubview(profileItem)
        stackView.addArrangedSubview(cartItem)
        stackView.addArrangedSubview(chatItem)
        
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(15)
        }
    }
  
    private func setupBindings() {
        homeItem.tapPublisher.sink { [weak self] in
            self?.selectadIndex = 0
        }.store(in: &cancellableSet)
        
        profileItem.tapPublisher.sink { [weak self] in
            self?.selectadIndex = 1
        }.store(in: &cancellableSet)
        
        cartItem.tapPublisher.sink { [weak self] in
            self?.selectadIndex = 2
        }.store(in: &cancellableSet)
        
        chatItem.tapPublisher.sink { [weak self] in
            self?.selectadIndex = 3
        }.store(in: &cancellableSet)
    }
}

