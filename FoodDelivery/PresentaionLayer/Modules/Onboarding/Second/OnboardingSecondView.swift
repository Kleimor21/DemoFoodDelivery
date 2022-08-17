//
//  OnboardingSecondView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class OnboardingSecondView: UIView {
  
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let nextButton = GreenButton()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(nextButton)
        
        titleLabel.text = R.string.localization.onboardingSecondTitle()
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = R.color.text_black()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        subtitleLabel.text = R.string.localization.onboardingSecondSubtitle()
        subtitleLabel.font = .boldSystemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        nextButton.setTitle(R.string.localization.onboardingSecondNextButton(), for: .normal)
        logoImageView.image = R.image.logoImageOnbording2()
        
    }
    private func setupConstraints() {
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-42)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(47)
            make.bottom.equalTo(titleLabel.snp.top).offset(-59)
        }
    }
}
