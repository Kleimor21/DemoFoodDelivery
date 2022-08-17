//
//  CheckBox.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import UIKit

class CheckBox: UIView {
    
    private var checkedSubjecy = PassthroughSubject<Bool, Never>()
    
    var checkedPublisher: AnyPublisher<Bool, Never> {
        checkedSubjecy.eraseToAnyPublisher()
    }
    
    private let button = UIButton()
    private let label = UILabel()
    
    private var isChecked = false {
        didSet {
            if isChecked {
                button.setImage(R.image.check_List_on(), for: .normal)
            } else {
                button.setImage(R.image.check_List_off(), for: .normal)
            }
        }
    }
    
    private var cancellableSet = Set<AnyCancellable>()
    
    init(text: String) {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
        setupBindings()
        
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(button)
        addSubview(label)
        
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        button.setImage(R.image.check_List_off(), for: .normal)
    }
    
    private func setupConstraintes() {
        button.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(22)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(button.snp.centerY)
            make.left.equalTo(button.snp.right).offset(8)
            make.top.right.bottom.equalToSuperview()
        }
        
        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(22).priority(999)
        }
    }
    
    private func setupBindings() {
        button.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.isChecked.toggle()
            self.checkedSubjecy.send(self.isChecked)
        }.store(in: &cancellableSet)
    }
}
