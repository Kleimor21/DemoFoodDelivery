//
//  searchInput.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit

class SearchInput: UIView {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let textField = UITextField()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraintes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50)
    }
    
    private func setupView() {
        backgroundColor = R.color.orange_Fon()?.withAlphaComponent(0.1)
        layer.cornerRadius = 15
        
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textField)
        
        imageView.image = R.image.icon_Search()
        
        textField.textColor = R.color.orange_Text()
        textField.font = .boldSystemFont(ofSize: 14)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(
            string: R.string.localization.searchInputTextField(),
            attributes: [NSAttributedString.Key.foregroundColor: R.color.orange_Text()?.withAlphaComponent(0.4)]
        )
    }
    
    private func setupConstraintes() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
    }
}
