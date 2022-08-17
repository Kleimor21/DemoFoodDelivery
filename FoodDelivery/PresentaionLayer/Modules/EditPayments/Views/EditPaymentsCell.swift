//
//  EditPaymentsCell.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit

class EditPaymentsCell: UICollectionViewCell {
    
    static let reuseId = String(describing: self)
    
    private let typeImage = UIImageView()
    private let labelCard = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraintes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        typeImage.image = nil
        labelCard.text = nil
    }
    
    func configur(paymentTemplate: PaymentTemplate) { 
        
        let letters = paymentTemplate.cardNumber
        let end = letters.index(letters.endIndex, offsetBy: -4)
        let value = String(repeating: "*", count: letters.count - 12)
        let result = letters.replacingCharacters(in: end..., with: value)
        
        labelCard.text = result
        typeImage.image = paymentTemplate.type.image
    }
    
    private func setupView() {
        addSubview(typeImage)
        addSubview(labelCard)
        
        backgroundColor = R.color.medium_Gray()
        layer.cornerRadius = 22
        
        labelCard.textColor = .black
        labelCard.font = .boldSystemFont(ofSize: 14)
    }
    
    private func setupConstraintes() {

        typeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }

        labelCard.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
    }
}

private extension PaymentType {

    var image: UIImage? {
        switch self {
        case .paypal:
            return R.image.paypal_Logo()
        case .visa:
            return R.image.visa_Logo()
        case .payoneer:
            return R.image.payoneer_Logo()
        case .unknown:
            return nil
        }
    }
}
