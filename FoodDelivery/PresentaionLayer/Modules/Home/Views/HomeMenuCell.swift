//
//  HomeMenuCell.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit

class HomeMenuCell: UICollectionViewCell {
    
    static let reuseId = String(describing: self)
    
    let dishNameLabel = UILabel()
    let warungHerbalLabel = UILabel()
    let pricLabel = UILabel()
    let imageView = UIImageView()
    let stackViewMenu = UIStackView()
    
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
        
        dishNameLabel.text = nil
        warungHerbalLabel.text = nil
        pricLabel.text = nil
    }
    
    func configur(menu: HomeMenu) {
        dishNameLabel.text = menu.titel
        warungHerbalLabel.text = menu.desckription
        pricLabel.text = "$\(menu.price)"
    }
    
    private func setupView() {
       
        backgroundColor = .white
        layer.cornerRadius = 22
        layer.borderWidth = 1
        layer.borderColor = R.color.lightGray()?.cgColor
        
        addSubview(dishNameLabel)
        addSubview(warungHerbalLabel)
        addSubview(imageView)
        addSubview(pricLabel)
        
        imageView.image = R.image.menuPhoto1()
        
        dishNameLabel.textColor = R.color.text_black()
        dishNameLabel.font = .boldSystemFont(ofSize: 15)
        
        warungHerbalLabel.textColor = R.color.textLighy_Gray()
        warungHerbalLabel.font = .boldSystemFont(ofSize: 14)
        warungHerbalLabel.alpha = 0.3

        pricLabel.font = .boldSystemFont(ofSize: 22)
        pricLabel.textColor = R.color.orange_Price()
    }
    
    private func setupConstraintes() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(64)
            make.centerY.equalToSuperview()
            make.left.equalTo(snp.left).offset(11)
        }
        
        dishNameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(21)
            make.top.equalToSuperview().offset(25)
            make.height.equalTo(20)
        }
        
        warungHerbalLabel.snp.makeConstraints { make in
            make.top.equalTo(dishNameLabel.snp.bottom).offset(4)
            make.left.equalTo(dishNameLabel.snp.left)
            make.height.equalTo(14)
        }
        
        pricLabel.snp.makeConstraints { make in
            make.right.equalTo(snp.right).offset(-20)
            make.centerY.equalToSuperview()
        }
    }
}
